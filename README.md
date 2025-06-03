# Object-Centric Choreographies: Artifact for ER 2025 Submission

This repository accompanies the paper:

**"Detecting Conflicting Object Views in Object-Centric Process Choreographies"**  
(*Submitted to ER 2025*)

It provides the source models and verification setup used to evaluate the detection and resolution of conflicting object views in concurrent object-centric choreographies.

---

## Scenario

This repository investigates an appointment scheduling scenario in a radiology department, as presented in the paper. This scenario serves as the baseline model. The corresponding BPMN choreography is illustrated below.

![Baseline BPMN Choreography Model](baseline/choreography_diagram_baseline.svg)

Following the translation approach described in the paper, we transformed the baseline choreography into a typed Petri Net with Identifiers (t-PNID) that captures its object-centric semantics. This net was then encoded as a Colored Petri Net in CPN Tools, as shown below.

![Baseline Object-Centric Semantics](baseline/semantics_baseline.png)

In addition to the baseline model, this repository also includes two variations that implement optimistic and pessimistic coordination patterns, respectively. The models and corresponding verification results can be found in the respective directories.

---

## Repository Structure

The repository contains three directories, each corresponding to a variant of the appointment scheduling choreography model:

- `baseline/` – Original choreography without coordination pattern  
- `optimistic/` – Choreography using the optimistic coordination pattern  
- `pessimistic/` – Choreography using the pessimistic coordination pattern

Each directory contains:

| File/Directory         | Description |
|------------------------|-------------|
| `*.svg` / `*.pdf`      | BPMN choreography diagram |
| `*.cpn`                | CPN model implementing the t-PNID translation and ASK-CTL query for verification |
| `*.png`                | Illustration of the CPN model implementing the t-PNID translation |
| `conflict-detection.sml` | SML source file implementing the main function used to detect conflicting object views |
| `results/`             | Contains verification results for three test scenarios (see below) |

### `results/` Directory

Each `results/` subdirectory contains `.png` files visualizing the outcome of ASK-CTL verification for three scenarios:

| Scenario Type                       | File Pattern                             | Description                                                                 |
|------------------------------------|------------------------------------------|-----------------------------------------------------------------------------|
| Single-instance execution          | `I1-P1-R1-A1-[true/false].png`           | A single choreography instance with one patient, radiology, and appointment |
| Multi-instance, identical patients | `I2-P1-R1-A1-[true/false].png`           | Two concurrent instances with the same patient                              |
| Multi-instance, distinct patients  | `I2-P2-R1-A1-[true/false].png`           | Two concurrent instances with different patients                            |

Each filename ends in `-true.png` if the choreography was verified to be **conflict-free**, and `-false.png` if **conflicts were detected**.

---

## How to Run the Models

### Requirements

- [CPN Tools](https://cpntools.org) (tested on version 4.0.1)
- The newer CPN IDE is **not yet tested** with this artifact due to the lack of support for ASK-CTL

### Steps

1. Open the `.cpn` file in CPN Tools  
2. Follow the instructions inside the model (in the annotation nodes) to:
   - Compute the full state space
   - Apply the ASK-CTL query for conflict-freedom
3. Compare results across model variants (baseline, optimistic, and pessimistic)

---

## Notes

- All CPN models are finite and bounded to support full state space generation in ASK-CTL  
