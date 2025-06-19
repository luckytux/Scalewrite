// File: lib/data/static/ipo_checklists.dart

import '../../models/ipo_checklist.dart';

final List<IPOChecklist> allIpoChecklists = [
  IPOChecklist(
    id: 'IPO-1',
    title: 'Retail Computing Scales',
    sections: [
      'Device is approved for trade use (NoA, Act Section 8)',
      'Device is suitable for the actual use (STP‑1)',
      'Device has been initially inspected and bears verification marks (R.29)',
      'Device is sealed (NoA, STP‑4)',
      'Installation and location conform to NoA and manufacturer’s instructions (STP‑7)',
      'Marking is present, correct, and permanent (STP‑3)',
      'Display test: segments, annunciators (STP‑5)',
      'Recording element (printer/tape) test (STP‑6)',
      'Zero‑setting, tare, price computation, sleep mode test (STP‑8 to STP‑12)',
      'Performance tests: load discrimination, increasing/decreasing, eccentricity, repeatability, motion detection, price accuracy, mathematical concordance, disturbance tests (STP‑13 to STP‑23)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-2',
    title: 'Point of Sale (POS) Weighing Systems',
    sections: [
      'POS scale conforms to NoA and manufacturer’s instructions (STP‑1, STP‑7)',
      'Display, marking, sealing, configuration checked (STP‑3 to STP‑5)',
      'Recording element tested (STP‑6)',
      'Zero‑setting, manual entry, sleep mode, free floating signal (STP‑8 to STP‑12)',
      'Performance testing: load discrimination, increasing/decreasing, eccentricity, repeatability, agreement of registration, display blanking, motion detection, price accuracy, mathematical concordance, disturbance tests (STP‑13 to STP‑23)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-3',
    title: 'Steel Yard / Mechanical Hanging Scales',
    sections: [
      'Device is approved, verified, sealed (NoA, STP‑1 to STP‑4)',
      'Installation, support, clearance, leveling, protection (STP‑7)',
      'Marking plate condition (STP‑3)',
      'Beam, poise, zero‑setting mechanism integrity (STP‑5)',
      'Load discrimination, increasing/decreasing, eccentricity, repeatability (STP‑13 to STP‑16)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-4',
    title: 'Platform Scales',
    sections: [
      'Device is approved, verified, sealed (NoA, STP‑1 to STP‑4)',
      'Installation and location conform (STP‑7)',
      'Marking, display (electronic/mechanical), recording (STP‑3 to STP‑6)',
      'Configuration, zero‑setting mechanism range (STP‑2, STP‑8)',
      'Manual entry, sleep, tare, free floating weight signal (STP‑9 to STP‑12)',
      'Performance tests: load discrimination, increasing/decreasing, eccentricity, agreement, repeatability, motion detection, disturbance (STP‑13 to STP‑23)',
      'Off‑level testing if applicable (STP‑22)',
      'Calibration of trade weights on beam scales (STP‑29)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-5',
    title: 'Single‑point Suspended Scales',
    sections: [
      'Device is approved, verified, sealed (NoA, STP‑1 to STP‑4)',
      'Installation support, clearance, leveling, protection (STP‑7)',
      'Marking plate condition (STP‑3)',
      'Indicator/display/printer condition (STP‑5, STP‑6)',
      'Configuration and test ranges (STP‑2, STP‑8 to STP‑12)',
      'Performance testing: load discrimination, increasing/decreasing, eccentricity, agreement, repeatability, motion detection, disturbance (STP‑13 to STP‑23)',
      'Off‑level testing if applicable (STP‑22)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-6',
    title: 'Hopper or Tank Scales',
    sections: [
      'Device is approved, verified, sealed (NoA, STP‑1 to STP‑4)',
      'Installation, support, clearance, leveling, protection (STP‑7)',
      'Loading standards and interference checks (dust/fume, auto‑lift systems)',
      'Marking, display, printer condition (STP‑3 to STP‑6)',
      'Configuration and range checks (STP‑2, STP‑8 to STP‑12)',
      'Performance testing: load discrimination, increasing/decreasing, eccentricity, repeatability, disturbance (STP‑13 to STP‑23)',
      'Multi‑deck system checks if applicable (STP‑26)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-7',
    title: 'Crane Scales',
    sections: [
      'Device is approved, verified, sealed (NoA, STP‑1 to STP‑4)',
      'Installation support, clearance, operating view (STP‑7)',
      'Marking, display/printer condition (STP‑3 to STP‑6)',
      'Configuration, range checks (STP‑2, STP‑8 to STP‑12)',
      'Performance testing: load discrimination, increasing/strain, eccentricity, agreement, repeatability, motion detection, disturbance (STP‑13 to STP‑23)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-8',
    title: 'Overhead Track Scales',
    sections: [
      'Approved, verified, sealed, and installation supported (NoA, STP‑1 to STP‑7)',
      'Holding rods/brackets secure, clearance maintained',
      'Marking plate, display/printer check (STP‑3 to STP‑6)',
      'Configuration and test ranges (STP‑2, STP‑8 to STP‑12)',
      'Performance testing: load discrimination, increasing/decreasing, eccentricity, agreement, repeatability, motion detection, disturbance (STP‑13 to STP‑23)',
      'Multi‑deck checks and element identification (STP‑26)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-9',
    title: 'Overhead Monorail / Combination Scales',
    sections: [
      'Device approved, verified, sealed, installation supported (NoA, STP‑1 to STP‑7)',
      'Track, load path, clearance, protection',
      'Multi‑deck system operation: element selection, ticket identification (STP‑26)',
      'Marking, display/printer checks (STP‑3 to STP‑6)',
      'Configuration and test ranges (STP‑2, STP‑8 to STP‑12)',
      'Performance testing: load discrimination, increasing/decreasing, eccentricity, agreement, repeatability, motion detection, disturbance (STP‑13 to STP‑23)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-10',
    title: 'On‑Board Weighing Systems (Truck/Machinery)',
    sections: [
      'Device approved, verified, sealed (NoA, STP‑1 to STP‑4)',
      'Installation, support, load‑cell mounting, secondary indicator if required (STP‑7)',
      'Display/printer visibility from operating position',
      'Configuration: no manual gross entry or keyboard tare (STP‑9, STP‑11)',
      'Tests: load discrimination, increasing/strain, eccentricity, agreement, repeatability, motion detection, disturbance (STP‑13 to STP‑23)',
      'Off‑level, motion, AZTM, sleep mode (STP‑10, STP‑12, STP‑22)',
      'NH₃ and other OBWS product tests (STP‑27, STP‑31)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-11',
    title: 'Vehicle Scales (Permanent/Portable)',
    sections: [
      'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
      'Installation, pit & understructure access (STP‑7)',
      'Multi‑deck, unattended, weigh‑in/ weigh‑out systems tested (STP‑24 to STP‑26)',
      'Marking, display/printer checks (STP‑3 to STP‑6)',
      'Configuration, test ranges (STP‑2, STP‑8 to STP‑12)',
      'Performance tests: load discrimination, increasing/decreasing, eccentricity, agreement, repeatability, disturbance (STP‑13 to STP‑23)',
    ],
  ),
  IPOChecklist(
    id: 'IPO-12',
    title: 'Railway Track Scales (Fixed)',
    sections: [
      'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
      'Foundations, pit access, approach/departure ends (STP‑7)',
      'Test car available and suitable strain loads',
      'Marking, display/printer checks (STP‑3 to STP‑6)',
      'Configuration, test ranges (STP‑2, STP‑8 to STP‑12)',
      'Performance testing: load discrimination, increasing/decreasing, eccentricity, agreement, repeatability, disturbance (STP‑13 to STP‑23)',
      'Multi‑deck, weigh‑in/out systems tested (STP‑24 to STP‑26)',
    ],
  ),
];

/// Map lookup by IPO id (e.g., 'IPO-1')
final Map<String, IPOChecklist> ipoChecklists = {
  for (var ipo in allIpoChecklists) ipo.id: ipo
};
