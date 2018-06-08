# Asw_Project


https://gist.github.com/sukharevd/6087988
https://kb.novaordis.com/index.php/Start_WildFly_as_a_systemd_Service_on_Linux
http://support.elegantjbi.com/support/solutions/articles/9000108381-configuring-wildfly-as-a-service-in-linux
https://stackoverflow.com/questions/42907443/wildfly-as-systemd-service
https://github.com/Phidelux/vagrant-javaee-wildfly/blob/master/Vagrantfile
https://github.com/Phidelux/vagrant-javaee-wildfly
http://planet.jboss.org/post/vagrant_with_docker_provider_using_wildfly_and_java_ee_7_image
https://github.com/Phidelux/vagrant-javaee-wildfly/blob/master/vagrant/conclusion.sh


<h2><a id="user-content-usage" class="anchor" aria-hidden="true" href="#usage"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Developer</h2>

comandi :
<pre><code> vagrant up 
</code></pre>

fatto questo possiamo vedere all'url :
http://localhost:8082/
che wildfly è correttamente funzionante

per poter buildare e deployare i progetti contenuti dentro la directory deployments invece bisogna:

<pre><code> vagrant ssh dev 
</code></pre>

andare nella cartella degi script eseguendo
<pre><code>cd /home/asw/_shared/script
</code></pre> e far partire lo script:

<pre><code>sudo sh deploy-project.sh
</code></pre>
questo comando ha il fine di deployare i due progetti contenenti nella directory deploy di cui uno già buildato (hello.war) e uno da buildare (SpringBootBasic) 
la prima cosa che fa lo script è entrare dentro il progetto SpringBootBasic e buildarlo attraverso maven 
successivamente procede al deploy di tutti i progetti buildati (*.war)

finita l'esecuzione all' URL:

http://localhost:8082/hello/hello

http://localhost:8082/SpringBootBasic/hello/Professore

è possibile constatare se i progetti sono stati correttamente deployati
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
