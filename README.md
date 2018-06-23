# Asw_Project


https://gist.github.com/sukharevd/6087988
https://kb.novaordis.com/index.php/Start_WildFly_as_a_systemd_Service_on_Linux
http://support.elegantjbi.com/support/solutions/articles/9000108381-configuring-wildfly-as-a-service-in-linux
https://stackoverflow.com/questions/42907443/wildfly-as-systemd-service
https://github.com/Phidelux/vagrant-javaee-wildfly/blob/master/Vagrantfile
https://github.com/Phidelux/vagrant-javaee-wildfly
http://planet.jboss.org/post/vagrant_with_docker_provider_using_wildfly_and_java_ee_7_image
https://github.com/Phidelux/vagrant-javaee-wildfly/blob/master/vagrant/conclusion.sh




<h2><a id="user-content-usage" class="anchor" aria-hidden="true" href="#usage"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>
Commenti riguardanti la prima fase del progetto (.WAR) </h2>

Durante la prima fase nella realizzazione del progetto il nostro obbiettivo è stato quello di installare in maniera corretta Wildfly e farlo partire su una VM di prova, il primo grande problema a cui si è andati in contro è stato il fatto che eseguendo lo script di wildfly standalone.sh la nostra bash rimaneva occupata dall'esecuzione di wildfly e non era possibile più utilizzarla.
Per rendere più comoda e immediata l'avvio dell'application server da parte dell'utente abbiamo consultato numerose guide ( linkate in testa alla pagina)  per far partire lo script di wildfly come un servizio, si è però notato che molti di essi modificavano il file standalone.xml o altri file di configurazione al fine di aggiungere variabili d'ambiente per funzionalità arricchite che per il fine del progetto non erano necessarie, abbiamo ovviato alla integrazione di tale servizio creando uno script che faccia partire wildfly in background con una semplice linea di comando contenuta nello script " start-wildfly.sh " .
Fatto questo si è passati al deploy di una applicazione web Hello_World classica non ancora buildata, Per il build abbiamo utilizzato Maven poichè ha un canale preferenziale con wildfly attraverso maven è possibile deployare un progetto buildato direttamente con la stringa di comando :
mvn wildfly:deploy
sempre se nel pom del progetto sono contenute le librerie a maven.
Per completezza però abbiamo scelto di non utilizzare questo comando e deployare il progetto in maniera " Standard " cioè attraverso lo script di wildfly chiamato jboss-cli.sh che si trova nella directory /bin di Wildfly.
Per prima cosa abbiamo, per l'appunto, buildato il progetto attraverso maven e preso il .war generato nella cartella di target e spostato nella cartella di Wildfly, fatto questo attraverso il nostro script deploy-project.sh avviamo lo script jboss-cli.sh e deployamo il progetto, fatto questo il progetto viene correttamente deployato.
Arriviamo all'ultima parte di questa prima fase, l'obbiettivo ultimo adesso era quello di eseguire correttamente il port forwarding, aver specificato la porta per il port forwarding sembrava non bastare. Per quanto riguarda i membri del gruppo che utilizzavano un Pc MacBook il port forwarding riusciva senza particolari intoppi, mentre chi utilizzava un sistema operativo Windows riscontrava numerosi problemi per visualizzare nel browser dell'host il corretto funzionamento degli script di start e deploy di Wildfly. 
Dopo numerose ricerche e settaggi vari (inutili) abbiamo scoperto che la causa del mancato port forwarding era quel MALEDETTO Windows Defender ( antivirus di Windows ). 
Fatto questo ci siamo occupati di fare questa stessa cosa con Docker e tentare di deployare ed eseguire un progetto EJB





<h2><a id="user-content-usage" class="anchor" aria-hidden="true" href="#usage"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>
Commenti riguardanti la seconda fase del progetto (Docker) </h2>

Docker non ci ha causato troppi problemi, avendo risolto il problema del port forwarding è bastata qualche guida ( linkata in alto ) e una consultazione della documentazione ufficiale di docker (https://hub.docker.com/r/jboss/wildfly/
) per far partire tutto.





































<h2><a id="user-content-usage" class="anchor" aria-hidden="true" href="#usage"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Docker</h2>

<pre><code>vagrant up 

</code></pre>

<pre><code>vagrant ssh docker
</code></pre>

<pre><code>vagrant cd dockerproject
</code></pre>

<pre><code>docker build --tag=wildfly .
</code></pre>

<pre><code>docker run -p 8080:8080 -it wildfly
</code></pre>


fatto questo possiamo vedere all'url : 
http://localhost:8081/
che wildfly è correttamente funzionante
e possiamo vedere anche che il progetto .war deployato funziona correttamente accedendo al seguente url :
http://localhost:8081/hello-world/hello
