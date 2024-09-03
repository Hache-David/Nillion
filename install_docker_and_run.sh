#!/bin/bash

# Met à jour la liste des paquets
sudo apt update

# Installe les dépendances nécessaires
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Ajoute la clé GPG officielle de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Ajoute le dépôt de Docker aux sources APT
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Met à jour la liste des paquets avec les nouveaux dépôts Docker
sudo apt update

# Installe Docker et ses composants
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Télécharge l'image Docker spécifique
docker pull nillion/retailtoken-accuser:v1.0.0

# Crée le répertoire pour monter le volume Docker
mkdir -p ~/nillion/accuser

# Exécute le conteneur Docker avec le montage de volume et initialise
docker run -v ~/nillion/accuser:/var/tmp nillion/retailtoken-accuser:v1.0.0 initialise
