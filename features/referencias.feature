# language: pt

@Referencias
Funcionalidade: Referência

Cenário: Referências configuradas como negrito em vez de itálico (padrão)
Dado descompactei o modelo padrão no diretório "referencias-negrito"
E o conteúdo do arquivo "referencias.bib"
"""
@Article{pane1996,
  Title                    = {Usability Issues in the Design of Novice Programming Systems},
  Author                   = {Pane, F. John and Myers, Brad A.},
  Journal                  = {Human-Computer Interaction Institute Technical Report CMU-HCII-96-101},
  Year                     = {1997}
}

@ABNT-options{minhasopcoes,
abnt-emphasize="bf",
abnt-full-initials="no",
abnt-show-options="warn",
abnt-thesis-year="final",
key="x"}
"""
E o conteúdo do arquivo "trabalho-academico.md"
"""
# Introdução

Realizando citação: \cite{pane1996}
"""
Quando executar o limarka
Então o arquivo "xxx-referencias.bib" foi criado

