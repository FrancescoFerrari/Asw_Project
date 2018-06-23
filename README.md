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

Durante la prima fase nella realizzazione del progetto il nostro obbiettivo è stato quello di installare in maniera corretta Wildfly e farlo partire su una VM di prova. Il primo grande problema a cui si è andati incontro, è stato il fatto che eseguendo lo script di wildfly <code>standalone.sh</code>  la nostra bash rimaneva occupata dall'esecuzione di wildfly e non era possibile più utilizzarla.
Per rendere più comodo e immediato l'avvio dell'application server da parte dell'utente abbiamo consultato numerose guide (linkate in testa alla pagina), per far partire lo script di wildfly come un servizio, si è però notato che molte di esse modificavano file come <code>standalone.xml</code> o altri file di configurazione al fine di aggiungere variabili d'ambiente per funzionalità arricchite, che per il fine del progetto non erano necessarie. Abbiamo ovviato alla creazione di tale servizio realizzando uno script  <code>start-wildfly.sh</code>che fa partire wildfly in background attraverso una semplice linea di comando.
Fatto questo si è passati al deploy di una applicazione web Hello_World classica, non ancora buildata. Per il build abbiamo utilizzato Maven, poichè ha un canale preferenziale con wildfly. Attraverso Maven è possibile il deploy di un progetto buildato, direttamente usando la stringa di comando :
<code>mvn wildfly:deploy</code>

sempre se nel pom del progetto sono contenute le librerie a maven.

Per fornire una panoramica completa di come è possibile deployare un progetto in Wildfly, abbiamo scelto di non utilizzare questo comando, di cui ci avvarremo nel deploy dell'EJB, e deployare il progetto in maniera " Standard " cioè attraverso lo script fornito da wildfly chiamato <code>jboss-cli.sh</code> che si trova nella directory <code>/bin</code> di Wildfly.
Abbiamo, per l'appunto, buildato il progetto attraverso maven, preso il .war generato nella cartella di target e spostato nella cartella di Wildfly. Fatto questo attraverso il nostro script <code>deploy-project.sh</code> avviamo lo script jboss-cli.sh e deployamo il progetto.
Arriviamo all'ultima parte di questa prima fase, l'obbiettivo ultimo era quello di eseguire correttamente il port forwarding, aver specificato la porta per il port forwarding sembrava non bastare. Per quanto riguarda i membri del gruppo che utilizzavano un Pc MacBook il port forwarding riusciva senza particolari intoppi, mentre chi utilizzava un sistema operativo Windows riscontrava numerosi problemi per visualizzare nel browser dell'host il corretto funzionamento degli script di start e deploy di Wildfly. 
Dopo numerose ricerche e settaggi vari (inutili) abbiamo scoperto che la causa del mancato port forwarding era l'antivirus di Windows Windows Defender. 
Una volta disattivato il port forwarding ha cominciato a funzionare anche per chi usava Windows.
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
