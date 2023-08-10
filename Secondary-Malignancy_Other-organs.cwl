cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  secondary-malignancy_other-organs-metastas---primary:
    run: secondary-malignancy_other-organs-metastas---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  secondary-malignancy_other-organs-system---primary:
    run: secondary-malignancy_other-organs-system---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-metastas---primary/output
  secondary-malignancy_other-organs-carcinoma---primary:
    run: secondary-malignancy_other-organs-carcinoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-system---primary/output
  secondary-malignancy_other-organs-neoplasm---primary:
    run: secondary-malignancy_other-organs-neoplasm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-carcinoma---primary/output
  secondary-malignancy_other-organs-respiratory---primary:
    run: secondary-malignancy_other-organs-respiratory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-neoplasm---primary/output
  digestive-secondary-malignancy_other-organs---primary:
    run: digestive-secondary-malignancy_other-organs---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-respiratory---primary/output
  secondary-malignancy_other-organs-specified---primary:
    run: secondary-malignancy_other-organs-specified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: digestive-secondary-malignancy_other-organs---primary/output
  urinary-secondary-malignancy_other-organs---primary:
    run: urinary-secondary-malignancy_other-organs---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-specified---primary/output
  secondary-malignancy_other-organs-bladder---primary:
    run: secondary-malignancy_other-organs-bladder---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: urinary-secondary-malignancy_other-organs---primary/output
  secondary-malignancy_other-organs-breast---primary:
    run: secondary-malignancy_other-organs-breast---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-bladder---primary/output
  nervous-secondary-malignancy_other-organs---primary:
    run: nervous-secondary-malignancy_other-organs---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-breast---primary/output
  secondary-malignancy_other-organs-cervix---primary:
    run: secondary-malignancy_other-organs-cervix---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: nervous-secondary-malignancy_other-organs---primary/output
  secondary-malignancy_other-organs-cancer---primary:
    run: secondary-malignancy_other-organs-cancer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-cervix---primary/output
  secondary-malignancy_other-organs-vulva---primary:
    run: secondary-malignancy_other-organs-vulva---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-cancer---primary/output
  secondary-malignancy_other-organs---primary:
    run: secondary-malignancy_other-organs---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-vulva---primary/output
  metastatic-secondary-malignancy_other-organs---primary:
    run: metastatic-secondary-malignancy_other-organs---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs---primary/output
  secondary-malignancy_other-organs-2ndry---primary:
    run: secondary-malignancy_other-organs-2ndry---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: metastatic-secondary-malignancy_other-organs---primary/output
  other---primary:
    run: other---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-2ndry---primary/output
  possible-secondary-malignancy_other-organs---primary:
    run: possible-secondary-malignancy_other-organs---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: other---primary/output
  secondary-malignancy_other-organs-neoplasm---secondary:
    run: secondary-malignancy_other-organs-neoplasm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: possible-secondary-malignancy_other-organs---primary/output
  secondary-malignancy_other-organs-unspecified---secondary:
    run: secondary-malignancy_other-organs-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-neoplasm---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: secondary-malignancy_other-organs-unspecified---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
