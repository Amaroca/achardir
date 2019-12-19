<h1> Achardir</h1>
<p>Utilitário em bash para encontrar diretórios de um determinado dominio</p>
Script é desenvolvido em Bash, e tem por objetivo varrer um dominio, trazendo os diretórios e arquivos disponiveis.

<h2>###### MODO DE USO ##########</h2>

<p>Na sua forma padrão:</p>
  <spam>ex: ./achardir.sh dominio.com.br</spam>
<p>Nesse caso especifico, teremos a sua execução padrão, onde as 3 wordilists disponiveis por padrão, serão utilizadas.</p>
 <p> A observação é que nessa forma, o tempo não é o importante, pois levará muito tempo até finalizar a consulta, levando em conta  que as 3 wordlists são bem grandes, porém, o resultado é excelente</p></br>
  <spam>Você terá 5 opçẽs para tipo de arquivos:</spam>
    <li>1 - arquivos em php</li>
    <li>2 - arquivos em html</li>
    <li>3 - arquivos em sql</li>
    <li>4 - arquivos em txt</li>
    <li>5 - all -> essa forma é bem demorada, pois testa mais de 10 tipos de arquivos, e isso é para cada linha da wordlist de arquivo por isso só use essa forma se tiver bastante tempo.</li>
<h2>############# COMO O SCRIPT FAZ A CONSULTA ###########</h2>


<h3>############ Primeira forma de uso ######</h3>

1 - No inicio é feito uma consulta na wordlist de diretorios,e na wl de extensões, sendo usada juntamente com o dominio. E através do Curl em sua forma
    silenciosa, é trazido o status_code, caso seja diferente de 404, no caso do diretório, ele retornará o nome com sucesso.
2 - Depois é feito uma consulta na wordlist de arquivos, e juntamente com o dominio, dominio/arquivo e com uso do curl é trazido
    a resposta com o status_code.
3 - Em uma terceira consulta, é feita uma leitura na wl dos diretorios, concatenando com os arquivos e com a wl de extensoes, trazendo
    o resultado como nos exemplos acima.
Por isso a demora nas consultas.

<h3>########### Segundo Modo ##############</h3>
1 - Você pode optar por usar suas próprias wordlist, a observação é que se for usar uma terá que usar as 3, uma pra diretorios, uma pra
    arquivos e outra para extensões, podendo aproveitar as ja disponiveis já no sistema.
    ex: ./achardir dominio.com.br dir.txt /usr/share/dirb/wordlist/common.txt ext.txt
2 - a busca é semelhante a primeira forma de uso.

OBS: Algo a ser observado é que mesmo o dominio tendo sido configurado para alguns tipos de consultas por scripts, provavelmente este
nosso script irá funcionar.

<h2>############### SOBRE A WORDLIST ##########</h2>
Como foi falado acima, se usar a forma padrão do script, levará com certeza não minutos, mas horas até finalizar toda a consulta.
Mas com certeza irá ter um ótimo resultado, mas se quiser algo mais rápido, crie sua propria wordlist, talvez seja mais rapido o resultado,
porém sem muitas novidades.
