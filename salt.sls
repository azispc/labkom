salt_ide:
  pkg:
      - installed
      - pkgs
          - mpi-default-dev
          - mpi-default-bin
          
salt_bioinformatic:
  pkg:
      - installed
      - pkgs
          - ugene
          - clustalw
          - clustalx
          - velvet-example
          - velvet-long
          - velvetoptimiser
          - velvet-tests
          - soapdenovo2
          - bowtie2
          - bowtie-examples
          - bowtie2-examples