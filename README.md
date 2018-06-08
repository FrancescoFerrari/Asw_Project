# Asw_Project


https://gist.github.com/sukharevd/6087988
https://kb.novaordis.com/index.php/Start_WildFly_as_a_systemd_Service_on_Linux
http://support.elegantjbi.com/support/solutions/articles/9000108381-configuring-wildfly-as-a-service-in-linux
https://stackoverflow.com/questions/42907443/wildfly-as-systemd-service
https://github.com/Phidelux/vagrant-javaee-wildfly/blob/master/Vagrantfile
https://github.com/Phidelux/vagrant-javaee-wildfly
http://planet.jboss.org/post/vagrant_with_docker_provider_using_wildfly_and_java_ee_7_image
https://github.com/Phidelux/vagrant-javaee-wildfly/blob/master/vagrant/conclusion.sh



#Developer
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

#Docker:

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
