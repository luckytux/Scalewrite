# ScaleWrite Project Plan

## ✅ Project Title
**ScaleWrite** — a Flutter-based offline-first field service app for managing scale inspections, weight tests, and reporting, built with Isar and Riverpod.

---

## 🧩 Project Structure and Modules

### 1. Core Features (Implemented & In Progress)
- **Work Orders**
  - Create work orders linked to customers
  - Collect company, address, billing, and contact info
  - Additional contact management
  - Work order numbers auto-generated
  - Connected to customer via IsarLink

- **Service Reports**
  - Linked to both Work Order and Scale
  - Allows creating or editing associated Scale
  - Optionally links to weight test and inspection forms
  - Future: scale form and legal status

- **Scales**
  - Modular or complete
  - Captures make/model/serial/approval/etc.
  - Linked to a customer
  - Editable inline or via modal in Service Report creation

- **Weight Tests**
  - Linked to a Service Report and a Scale
  - Stores eccentricity/increasing test results
  - Multiple tests per report
  - Future: logic validation and math built-in

- **Customers**
  - Manage customer info and contacts
  - Import/export via JSON
  - Selectable when creating work orders

- **Dashboard**
  - Overview of customers, work orders, reports, and weight tests
  - Planned: filter/sort/search support

---

## 🧠 Architecture & Design Choices

### ⚙️ Tech Stack
- **Flutter + Riverpod**: Modular, scalable state management
- **Isar DB**: Offline-first local database with object links
- **Material 3 UI**: Clean, user-friendly layout
- **Windows Target**: Current platform for development

### 🧩 Project Directory Structure
Modularized folders under `/lib`:
- `pages/` – UI page logic  
- `models/` – Isar collection classes  
- `widgets/` – UI components (reusable + domain-specific)  
- `controllers/` – Business logic (e.g., `WorkOrderFormController`)  
- `providers/` – Riverpod providers for state and controller access  
- `services/` – Database and sync logic  
- `forms/` – Modular subforms for inspections, tests, repairs  

> Future plan: Generate files with file path comments and organize consistently using this structure.

---

## 🔮 Future Plans

### 💾 Data Sync
- Sync local Isar DB with cloud-hosted SQL (via API or Azure)
- Add flags for synced vs unsynced
- Manual and background sync modes

### 📑 Final Report Submission
- Add review/finalization step for work orders
- Generate printable PDFs or exportable files
- Lock finalized data from further editing

### 📱 Multi-Device Usage
- Offline data entry on tablets/laptops
- Sync when online
- Conflict resolution strategy (latest write, user confirmation)

### 🔎 Admin & Search
- Add admin dashboard or role-based features
- Filter/search service reports, scales, and weight tests

### ✅ QA & Validation
- Add validation for report logic (e.g. test weights must balance)
- Highlight missing fields
- Auto-calculate total errors

---

## 🛠️ Completion Mode

### ✅ Current Focus
- Finalize Riverpod integration for **Work Order** module
- Modularize all major form UIs into widgets
- Normalize Scale linkage across reports
- Clean up legacy fields from models (e.g., duplicate scale fields in Service Report)

### ⏳ In Progress
- Service Report flow and save logic
- Modular Scale creation and editing
- Linking forms to Service Report and Scale

### 🧪 Next Steps
- Clean up test files
- Confirm weight test UI + saving
- Finish integration of reporting UI (dashboard/forms view/edit)
