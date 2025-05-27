# Object-Centric Choreographies: Artifact for ER 2025 Submission

This repository accompanies the paper:

**"Who Sees What? Detecting Conflicting Object Views in Object-Centric Process Choreographies"**  
(*Submitted to ER 2025*)

It provides the source models and verification setup used to evaluate the detection and resolution of conflicting object views in concurrent object-aware choreographies.

---

## Repository Structure

The repository contains three directories, each corresponding to a variant of the appointment scheduling choreography model:

- `baseline/` – Original choreography without coordination strategy  
- `optimistic/` – Choreography using the optimistic coordination strategy  
- `pessimistic/` – Choreography using the pessimistic coordination strategy

Each directory contains the following files:

| File                | Description |
|---------------------|-------------|
| `*.svg` / `*.pdf`   | BPMN choreography diagram |
| `*.cpn`             | CPN model implementing the t-PNID translation and ASK-CTL query for verification |
| `*.png`             | Illustration of the CPN model implementing the t-PNID translation |

- `conflict-detection.sml` – SML source file implementing the main function used to detect conflicting object views

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

## Screencast

A short screencast demonstrating the workflow is included in the repository root:  
`screencast.mp4`

---

## Notes

- All CPN models are finite and bounded to support full state space generation in ASK-CTL  
