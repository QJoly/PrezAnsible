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

[comment]: # (!!! data-background-color="#f6e58d")

Le but de cette présentation est de faire découvrir Ansible aux futurs utilisateurs. Il ne faut pas prendre cela pour un tutoriel dans un cadre professionnel.
<br>
En revanche, n'hésitez pas à partager et m'envoyer vos questions. Le site sera mis à jour si nécéssaire :)

[comment]: # (!!! data-background-color="#f6e58d")

# Qu'est ce que Ansible ? 

[comment]: # (!!! data-background-color="#f6e58d")

Ansible est un **outil d'orchestration**. Il permet de *controler* une ou plusieurs machines par ssh dans le but d'automatiser certaines taches. 

[comment]: # (!!! data-background-color="#f6e58d")

Vous devrez fournir à Ansible un fichier descriptif détaillant comment est-ce que la VM doit être configurée. 
On nomme ce fichier **"un playbook"**.  <br>
Si la machine est déjà correctement configurée, Ansible vous en informera et ne fera rien de plus. 

[comment]: # (!!! data-background-color="#f6e58d")

Les forces de Ansible sont simples: 
- Une communauté très active pour ajouter des fonctionnalités (Profitant de la popularité du Python)
[comment]: # (!!! data-background-color="#f6e58d" data-auto-animate )

Les forces de Ansible sont simples: 
- Une communauté très active pour ajouter des fonctionnalités (Profitant de la popularité du Python)
- Utilisation du YAML facilitant son utilisation 
[comment]: # (!!! data-background-color="#f6e58d" data-auto-animate )

Les forces de Ansible sont simples: 
- Une communauté très active pour ajouter des fonctionnalités (Profitant de la popularité du Python)
- Utilisation du YAML facilitant son utilisation 
- Agentless (Aucun agent à installer sur les machines à piloter, SSH suffit)

[comment]: # (!!! data-background-color="#f6e58d" )

# Débuter avec Ansible

[comment]: # (!!! data-background-color="#f6e58d" )

Comme dit précédemment : Ansible utilise **ssh** pour piloter les machines.
Il est possible de s'authentifier via mot de passe *(avec l'argument --ask-pass)* mais nous allons utiliser des clés **ssh**. 

*Cette étape sera détaillée en dessous*


[comment]: # (||| data-background-color="#f6e58d" )

Une clé asymétrique se compose toujours de 2 parties différentes : 
- Une clé publique
- Une clé privée

Elles ont des usages totalement différent. 
La clé privée est une preuve mathématique qui va correspondre à la clé publique. 

On donne donc la clé publique à une machine en lui demandant d'authentifier toute personne ayant la clé privé correspondant. 

Nous n'irons pas plus loin dans l'explication. 
Pour imager tout ça, la clé publique correspond à un identifiant (qui pourrait être donné à toute personne), et la clé privé à un mot de passe qui doit rester chez vous. 

[comment]: # (!!! data-background-color="#f6e58d" )

[comment]: # (!!! data-background-color="#f6e58d" )
