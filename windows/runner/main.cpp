// File: windows/runner/main.cpp

#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>
#include <shlobj.h>
#include <filesystem>
#include <fstream>
#include <string>
#include <vector>

#include "flutter_window.h"
#include "utils.h"

namespace {

std::wstring LocalAppDataPath() {
  PWSTR path = nullptr;
  std::wstring result;
  if (SUCCEEDED(SHGetKnownFolderPath(FOLDERID_LocalAppData, 0, NULL, &path))) {
    result.assign(path);
    CoTaskMemFree(path);
  }
  return result;
}

std::filesystem::path ExeDir() {
  wchar_t buf[MAX_PATH];
  DWORD n = GetModuleFileNameW(nullptr, buf, MAX_PATH);
  if (n == 0 || n == MAX_PATH) return std::filesystem::path(L".");
  return std::filesystem::path(buf).parent_path();
}

// UTF-8 encode a wide string (no warnings)
std::string Utf8FromWide(const std::wstring& w) {
  if (w.empty()) return std::string();
  int size = ::WideCharToMultiByte(CP_UTF8, 0, w.data(),
                                   static_cast<int>(w.size()),
                                   nullptr, 0, nullptr, nullptr);
  std::string out(static_cast<size_t>(size), '\0');
  if (size > 0) {
    ::WideCharToMultiByte(CP_UTF8, 0, w.data(),
                          static_cast<int>(w.size()),
                          out.data(), size, nullptr, nullptr);
  }
  return out;
}

void LogAppend(const std::string& line) {
  // A) %LOCALAPPDATA%\ScaleWrite_v2\logs\runner.log
  try {
    const auto base = LocalAppDataPath();
    if (!base.empty()) {
      std::filesystem::path logDir =
          std::filesystem::path(base) / L"ScaleWrite_v2" / L"logs";
      std::filesystem::create_directories(logDir);
      std::ofstream f((logDir / L"runner.log").string(), std::ios::app);
      f << line << "\n";
    }
  } catch (...) {}

  // B) Fallback next to EXE
  try {
    auto localLog = ExeDir() / L"runner_local.log";
    std::ofstream f(localLog.string(), std::ios::app);
    f << line << "\n";
  } catch (...) {}
}

}  // namespace

int APIENTRY wWinMain(_In_ HINSTANCE instance,
                      _In_opt_ HINSTANCE prev,
                      _In_ wchar_t* command_line,
                      _In_ int show_command) {
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  LogAppend("WinMain: entered");
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
  LogAppend("WinMain: COM initialized");

  // Absolute data path next to the EXE
  const auto exe_dir = ExeDir();
  const auto data_w  = (exe_dir / L"data").wstring();
  LogAppend(std::string("Using data path: ") + Utf8FromWide(data_w));
  flutter::DartProject project(data_w);

  // Args (keep software rendering while we diagnose)
  std::vector<std::string> args = GetCommandLineArguments();
  args.push_back("--enable-software-rendering");
  args.push_back("--verbose-logging");
  project.set_dart_entrypoint_arguments(std::move(args));

  LogAppend("WinMain: creating FlutterWindow");
  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  if (!window.Create(L"scalewrite_v2", origin, size)) {
    LogAppend("WinMain: window.Create FAILED (check data folder)");
    ::CoUninitialize();
    return EXIT_FAILURE;
  }
  window.SetQuitOnClose(true);
  LogAppend("WinMain: window created; entering message loop");

  ::MSG msg;
  int rc = 0;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
    rc = static_cast<int>(msg.wParam);
  }

  LogAppend("WinMain: message loop exited rc=" + std::to_string(rc));
  ::CoUninitialize();
  LogAppend("WinMain: exiting");
  return EXIT_SUCCESS;
}
