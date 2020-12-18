<h1> Achardir</h1>
<p>Utilitário em bash para encontrar diretórios de um determinado dominio</p>
Script é desenvolvido em Bash, e tem por objetivo varrer um dominio, trazendo os diretórios e arquivos disponiveis.

<h2>###### MODO DE USO ##########</h2>
<p>Ele já inicia criando um diretório com o nome do dominio e dentro dele é criado 2 arquivos, um chamado diretórios onde vai ser gravado todos os diretórios encontrados, em seguida é criado um arquivo chamado arquivos, onde é feito duas consultas para criar o conteúdo desse "arquivos", uma a partir da raiz e uma segunda combinando os diretórios encontrados com a wordlist de arquivos.</p>
<p>Na sua forma padrão:</p>
  <spam>ex: ./achardir.sh dominio.com.br</spam>
<p>Nesse caso especifico, teremos a sua execução padrão, onde as 3 wordilists disponiveis por padrão, serão utilizadas.</p>
 <p> A observação é que nessa forma, o tempo não é o importante, pois levará muito tempo até finalizar a consulta, levando em conta  que as 3 wordlists são bem grandes, porém, o resultado é excelente</p>
  <p>OBS: É imporante saber a linguagem do site analisado, para poder setar a opção numérica correta, do contrário, terá que fazer mais de uma consula, em opção numerica diferente, ou mesmo uilizar a oção FULL, mas é muio demorada, pois ele testa para cada arquivo, uma sequencia de combinação de extensões fazendo com que o processo seja muito demorado.</p>
  <spam>Você terá 5 opçẽs para tipo de arquivos:</spam>
    <li>1 - arquivos em php</li>
    <li>2 - arquivos em html</li>
    <li>3 - arquivos em sql</li>
    <li>4 - arquivos em txt</li>
    <li>5 - all -> essa forma é bem demorada, pois testa mais de 10 tipos de arquivos, e isso é para cada linha da wordlist de arquivo por isso só use essa forma se tiver bastante tempo.</li>
<h2>############# COMO O SCRIPT FAZ A CONSULTA ###########</h2>


<h3>############ Primeira forma de uso ######</h3>

<li>1 - No inicio é feito uma consulta na wordlist de diretorios,e na wordlist de extensões, sendo usada juntamente com o dominio. E através do Curl em sua forma silenciosa, é trazido o status_code, caso seja diferente de 404, no caso do diretório, ele retornará o nome com sucesso.</li>
<li>2 - Depois é feito uma consulta na wordlist de arquivos, e juntamente com o dominio, dominio/arquivo e com uso do curl é trazido a resposta com o status_code.</li>
<li>3 - Em uma terceira consulta, é feita uma leitura na wordlist dos diretorios, concatenando com os arquivos e com a wl de extensoes, trazendo o resultado como nos exemplos acima por essa razão a demora nas consultas.</i>

<h3>########### Segundo Modo ##############</h3>
<li>1 - Você pode optar por usar suas próprias wordlist, a observação é que se for usar uma terá que usar as 2, uma pra diretorios, uma pra arquivos, a wordlist de extensões será setado dentro das opções de 0 a 5 como já falado acima.</i>
    </p>./achardir dominio.com.br /usr/share/dirb/wordlist/small.txt /usr/share/dirb/wordlist/common.txt ext.txt</p>
<li>2 - a busca é semelhante a primeira forma de uso.</i>

<spam>lgo a ser observado é que mesmo o dominio tendo sido configurado para alguns tipos de consultas por scripts, provavelmente este
nosso script irá funcionar.</spam>

<h2>############### SOBRE A WORDLIST ##########</h2>
<p>Como foi falado acima, se usar a forma padrão do script, levará com certeza muito tempo até finalizar toda a consulta.</p>
<p><spam>Com certeza irá ter um ótimo resultado, mas se é preferivel você criar sua propria wordlist, talvez seja mais rapido o resultado.<spam/></p>
