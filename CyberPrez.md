[comment]: # (THEME = solarized)
[comment]: # (CODE_THEME = zenburn)
[comment]: # (The list of themes is at https://revealjs.com/themes/)
[comment]: # (The list of code themes is at https://highlightjs.org/)
[comment]: # (Pass optional settings to reveal.js:)
[comment]: # (controls: true)
[comment]: # (controlsTutorial: true)
[comment]: # (keyboard: true)
[comment]: # (progress: true)
[comment]: # (slideNumber: true)
[comment]: # (showSlideNumber: 'all')
[comment]: # (markdown: { smartypants: true })
[comment]: # (hash: true)
[comment]: # (respondToHashChanges: true)
[comment]: # (Other settings are documented at https://revealjs.com/config/)

CyberPrez #02 - Ansible
# Comprendre Ansible 

[comment]: # (!!! data-background-color="#2ecc71")

<font color="#000000">
Le but de cette présentation est de faire découvrir Ansible aux futurs utilisateurs. Il ne faut pas prendre cela pour un tutoriel dans un cadre professionnel.
<br>
En revanche, n'hésitez pas à partager et m'envoyer vos questions. Le site sera mis à jour si nécéssaire :)
</font>
[comment]: # (!!! data-background-color="#2ecc71")

# Qu'est ce que Ansible ? 

[comment]: # (!!! data-background-color="#2ecc71")

Ansible est un **outil d'orchestration**. Il permet de *controler* une ou plusieurs machines par ssh dans le but d'automatiser certaines taches. 

[comment]: # (!!! data-background-color="#2ecc71")

Vous devrez fournir à Ansible un fichier descriptif détaillant comment est-ce que la VM doit être configurée. 
On nomme ce fichier *"un playbook"*. 
Si la machine est déjà correctement configurée, Ansible vous en informera et ne fera rien de plus. 

[comment]: # (!!! data-background-color="#2ecc71")

Les forces de Ansible sont simples: 
- Une communauté très active pour ajouter des fonctionnalités (Profitant de la popularité du Python)
[comment]: # (!!! data-background-color="#2ecc71" data-auto-animate )

Les forces de Ansible sont simples: 
- Une communauté très active pour ajouter des fonctionnalités (Profitant de la popularité du Python)
- Utilisation du YAML facilitant son utilisation 
[comment]: # (!!! data-background-color="#2ecc71" data-auto-animate )

Les forces de Ansible sont simples: 
- Une communauté très active pour ajouter des fonctionnalités (Profitant de la popularité du Python)
- Utilisation du YAML facilitant son utilisation 
- Agentless (Aucun agent à installer sur les machines à piloter, SSH suffit)

[comment]: # (!!! data-background-color="#2ecc71" )
