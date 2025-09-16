// File: lib/data/static/ipo_checklists.dart

import '../../models/ipo_checklist.dart';
import '../../models/ipo_section.dart';

final List<IPOChecklist> allIpoChecklists = [
  IPOChecklist(
    id: 'IPO-1',
    title: 'Retail Computing Scales',
    sections: [
      IPOSection(
        title: 'Trade Approval & Verification',
        items: [
          'Device is approved for trade use (NoA, Act Section 8)',
          'Device is suitable for actual use (STP‑1)',
          'Device has been initially inspected and bears verification marks (R.29)',
          'Device is sealed (NoA, STP‑4)',
        ],
      ),
      IPOSection(
        title: 'Installation & Marking',
        items: [
          'Installation and location conform to NoA & manufacturer instructions (STP‑7)',
          'Marking is present, correct, and permanent (STP‑3)',
        ],
      ),
      IPOSection(
        title: 'Display & Recording',
        items: [
          'Display test: segments, annunciators (STP‑5)',
          'Recording element (printer/tape) test (STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration & Zero/Tare Tests',
        items: [
          'Zero-setting, tare, price computation, sleep mode tests (STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Repeatability',
          'Motion detection',
          'Price accuracy',
          'Mathematical concordance',
          'Disturbance tests (STP‑13 to STP‑23)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-2',
    title: 'Point of Sale (POS) Weighing Systems',
    sections: [
      IPOSection(
        title: 'Installation & Display',
        items: [
          'Conforms to NoA & manufacturer instructions (STP‑1, STP‑7)',
          'Display, marking, sealing, configuration checked (STP‑3 to STP‑5)',
        ],
      ),
      IPOSection(
        title: 'Recording Element',
        items: [
          'Recording element tested (STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Zero-setting, manual entry, sleep mode, free floating signal (STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Repeatability',
          'Agreement of registration',
          'Display blanking',
          'Motion detection',
          'Price accuracy',
          'Mathematical concordance',
          'Disturbance tests (STP‑13 to STP‑23)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-3',
    title: 'Steel Yard / Mechanical Hanging Scales',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
          'Installation: support, clearance, leveling, protection (STP‑7)',
        ],
      ),
      IPOSection(
        title: 'Marking & Mechanism',
        items: [
          'Marking plate condition (STP‑3)',
          'Beam, poise, zero-setting mechanism integrity (STP‑5)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity (if applicable)',
          'Repeatability (STP‑13 to STP‑16)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-4',
    title: 'Platform Scales',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
          'Installation and location conform (STP‑7)',
        ],
      ),
      IPOSection(
        title: 'Marking & Display',
        items: [
          'Marking, display (electronic or mechanical), recording (STP‑3 to STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Zero-setting mechanism range (STP‑2, STP‑8)',
          'Manual entry, sleep, tare, free floating signal (STP‑9 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Agreement of registration',
          'Repeatability',
          'Motion detection',
          'Disturbance tests (STP‑13 to STP‑23)',
          'Off-level testing if applicable (STP‑22)',
          'Calibration of trade weights where applicable (STP‑29)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-5',
    title: 'Single‑point Suspended Scales',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
          'Installation support, clearance, leveling, protection (STP‑7)',
        ],
      ),
      IPOSection(
        title: 'Marking & Display',
        items: [
          'Marking plate condition (STP‑3)',
          'Indicator/display/printer condition (STP‑5, STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Configuration and test ranges (STP‑2, STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Agreement of registration',
          'Repeatability',
          'Motion detection',
          'Disturbance tests (STP‑13 to STP‑23)',
          'Off-level testing if applicable (STP‑22)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-6',
    title: 'Hopper or Tank Scales',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
          'Installation, support, clearance, leveling, protection (STP‑7)',
        ],
      ),
      IPOSection(
        title: 'Specific Checks',
        items: [
          'Loading standards and interference checks (dust/fume, auto‑lift)',
        ],
      ),
      IPOSection(
        title: 'Marking & Display',
        items: [
          'Marking, display, printer condition (STP‑3 to STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Configuration and range checks (STP‑2, STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Repeatability',
          'Disturbance tests (STP‑13 to STP‑23)',
          'Multi-deck system checks (STP‑26)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-7',
    title: 'Crane Scales',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
          'Installation, support, clearance, operating view (STP‑7)',
        ],
      ),
      IPOSection(
        title: 'Marking & Display',
        items: [
          'Marking, display/printer condition (STP‑3 to STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Configuration and range checks (STP‑2, STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination and strain testing',
          'Eccentricity',
          'Agreement of registration',
          'Repeatability',
          'Motion detection',
          'Disturbance tests (STP‑13 to STP‑23)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-8',
    title: 'Overhead Track Scales',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed, installation supported (NoA, STP‑1 to STP‑7)',
          'Holding rods/brackets secure, clearance maintained',
        ],
      ),
      IPOSection(
        title: 'Marking & Display',
        items: [
          'Marking plate, display/printer check (STP‑3 to STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Configuration and test ranges (STP‑2, STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Agreement of registration',
          'Repeatability',
          'Motion detection',
          'Disturbance tests (STP‑13 to STP‑23)',
          'Multi-deck checks and element identification (STP‑26)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-9',
    title: 'Overhead Monorail / Combination Scales',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed, installation supported (NoA, STP‑1 to STP‑7)',
          'Track, load path, clearance, protection',
        ],
      ),
      IPOSection(
        title: 'Multi-Deck Tests',
        items: [
          'Multi-deck system operation: element selection, ticket identification (STP‑26)',
        ],
      ),
      IPOSection(
        title: 'Marking & Display',
        items: [
          'Marking, display/printer checks (STP‑3 to STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Configuration and test ranges (STP‑2, STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Agreement of registration',
          'Repeatability',
          'Motion detection',
          'Disturbance tests (STP‑13 to STP‑23)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-10',
    title: 'On‑Board Weighing Systems (Truck/Machinery)',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
          'Installation: support, load-cell mounting, secondary indicator (STP‑7)',
          'Display/printer visibility from operating position',
        ],
      ),
      IPOSection(
        title: 'Configuration Rules',
        items: [
          'No manual gross weight entry or keyboard tare (STP‑9, STP‑11)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination and strain testing',
          'Eccentricity',
          'Agreement of registration',
          'Repeatability',
          'Motion detection',
          'Disturbance tests (STP‑13 to STP‑23)',
          'Off-level, motion, AZTM, sleep-mode checks (STP‑10, STP‑12, STP‑22)',
          'NH₃ & other OBWS product tests (STP‑27, STP‑31)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-11',
    title: 'Vehicle Scales (Permanent/Portable)',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
          'Installation: pit & understructure access (STP‑7)',
        ],
      ),
      IPOSection(
        title: 'System Tests',
        items: [
          'Multi-deck, unattended, weigh-in/out systems tested (STP‑24 to STP‑26)',
        ],
      ),
      IPOSection(
        title: 'Marking & Display',
        items: [
          'Marking, display/printer checks (STP‑3 to STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Configuration and test ranges (STP‑2, STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Agreement of registration',
          'Repeatability',
          'Disturbance tests (STP‑13 to STP‑23)',
        ],
      ),
    ],
  ),
  IPOChecklist(
    id: 'IPO-12',
    title: 'Railway Track Scales (Fixed)',
    sections: [
      IPOSection(
        title: 'Approval & Setup',
        items: [
          'Approved, verified, sealed (NoA, STP‑1 to STP‑4)',
          'Foundations, pit access, approach/departure ends (STP‑7)',
          'Test car available and suitable strain loads',
        ],
      ),
      IPOSection(
        title: 'Marking & Display',
        items: [
          'Marking, display/printer checks (STP‑3 to STP‑6)',
        ],
      ),
      IPOSection(
        title: 'Configuration Tests',
        items: [
          'Configuration and test ranges (STP‑2, STP‑8 to STP‑12)',
        ],
      ),
      IPOSection(
        title: 'Performance Tests',
        items: [
          'Load discrimination',
          'Increasing/decreasing loads',
          'Eccentricity',
          'Agreement of registration',
          'Repeatability',
          'Disturbance tests (STP‑13 to STP‑23)',
          'Multi-deck, weigh-in/out systems tested (STP‑24 to STP‑26)',
        ],
      ),
    ],
  ),
];

final Map<String, IPOChecklist> ipoChecklists = {
  for (var ipo in allIpoChecklists) ipo.id: ipo,
};
