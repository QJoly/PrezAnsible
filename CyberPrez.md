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

# Qu'est ce qu'Ansible ? 

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

[comment]: # (!!! data-background-color="#f6e58d" )

Une clé asymétrique se compose toujours de 2 parties différentes : 
- Une clé publique
- Une clé privée

Elles ont des usages totalement différent. 
La clé privée est une preuve mathématique qui va correspondre à la clé publique. 

On donne donc la clé publique à une machine en lui demandant d'authentifier toute personne ayant la clé privé correspondant. 

Nous n'irons pas plus loin dans l'explication. 
Pour imager tout ça, la clé publique correspond à un identifiant (qui pourrait être donné à toute personne), et la clé privé à un mot de passe qui doit rester chez vous. 

[comment]: # (||| data-background-color="#f6e58d" )

Nous pouvons générer une paire de clés via la commande suivante: 
```bash
ssh-keygen -t ed25519
```
Si vous laissez les paramètres par défaut, vous aurez vos clés à cet emplacement : 
- ~/.ssh/id_ed25519 pour la clé privée
- ~/.ssh/id_ed25519.pub pour la clé publique

[comment]: # (||| data-background-color="#f6e58d" )

Pour que ces clés permettent l'authentification, il faudra copier le contenu de la clé publique dans le fichier `~/.ssh/authorized_keys` de l'utilisateur sur lequel vous voulez vous authentifier. 

Si vous voulez vous authentifier sur le serveur "192.168.1.20" avec l'utilisateur "thebidouilleur", il faudra copier votre clé publique (`~/.ssh/id_ed25519.pub`) dans le fichier `/home/thebidouilleur/.ssh/authorized_keys` du serveur *192.168.1.20*

[comment]: # (||| data-background-color="#f6e58d" )

Avant même de créer une suite d'instruction, nous devons créer notre **pool de machines joignables** par Ansible. 
On va donc créer un fichier qui sera notre **inventaire** Ansible. 

[comment]: # (!!! data-background-color="#f6e58d" )

Par défaut, votre inventaire se trouve à cet emplacement : `/etc/ansible/hosts`
Voici un exemple d'inventaire: 

```ini
192.168.1.20
192.168.1.199 ansible_host=jacob
[cluster]
192.168.1.200
192.168.1.201
192.168.1.202
```

[comment]: # (!!! data-background-color="#f6e58d" )

Un playbook ne va pas forcément communiquer avec toutes les machines de l'inventaire. Celui-ci peut demander l'accès à la machine nommée "jacob" ou aux machines présentent dans le groupe "cluster". 

Pour voir ce fonctionnement, créons notre premier playbook. 

[comment]: # (!!! data-background-color="#f6e58d" )

## Premier playbook

[comment]: # (!!! data-background-color="#f6e58d" )

