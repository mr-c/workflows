#!/usr/bin/env cwl-runner

class: CommandLineTool

description: "Run the diginorm method on a collection of reads."

inputs:
  - id: "#reads"
    inputBinding:
      position: 0
    type:
      type: array
      items: File
  - id: "#paired"
    type: boolean
    default: false
    inputBinding:
      prefix: "--paired"
  - id: "#force_single"
    type: boolean
    default: false
    inputBinding:
      prefix: "--force_single"
  - id: "#unpaired_reads"
    type: File
    streamable: true
    default: null
    inputBinding:
      prefix: "--unpaired-reads"
  - id: "#countgraph"
    type: File
    streamable: true
    default: null
    inputBinding:
      prefix: "--loadgraph"
  - id: "#savegraph"
    type: boolean
    default: false
    inputBinding:
      prefix: "--savegraph countgraph.oxlicg"
  - id: "#reportparameter"
    type: string
    default: "report.txt"
    inputBinding:
      prefix: "--report"
  - id: "#cutoff"
    type: int
    default: null
    inputBinding:
      prefix: "--cutoff"

outputs:
  - id: "#diginormed_reads"
    type: File
    outputBinding: { "glob": "*.keep" }
  - id: "#report"
    type: File
    outputBinding: { "glob": "report.txt" }

baseCommand: ["normalize-by-median.py"]

