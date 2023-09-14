#!/usr/bin/env nextflow

params.greetings = 'Bonjour,Ciao,Hello,Hola'

process sayHello {
  input:
    val greeting_str

  output:
    stdout

  script:
    """
    echo $greeting_str world!
    """

  stub:
    """
    echo Hello world!
    """
}

workflow {
  Channel
    .of(params.greetings)
    .splitCsv()
    .flatten()
    | sayHello
    | view
}
