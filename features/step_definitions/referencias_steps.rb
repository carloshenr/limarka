require 'limarka'
require 'fileutils'
require 'byebug'

Dado(/^descompactei o modelo padrão no diretório "(.*?)"$/) do |diretorio|
  @dir = "tmp/#{diretorio}"
  FileUtils.rm_rf @dir
  Dir.chdir('tmp')
  `git clone https://github.com/abntex/trabalho-academico-limarka #{diretorio}`
  Dir.chdir(diretorio)
end

Dado(/^o conteúdo do arquivo "(.*?)"$/) do |arquivo, string|
  IO.write(arquivo, string)
end

Quando(/^executar o limarka$/) do
  options = {configuracao_yaml: false, input_dir: '.', output_dir: '.', compila_tex: true, templates_dir: Dir.pwd}
  t = Limarka::Trabalho.new
  t.atualiza_de_arquivos(options)
  cv = Limarka::Conversor.new(t,options)
  cv.convert
  cv.usa_pdftotext = false
  cv.compila
end

Então(/^o arquivo "(.*?)" foi criado$/) do |arquivo|
  expect(File).to exist(arquivo)
end

