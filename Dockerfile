# Dockerfile
# Étape 1: Utiliser une image de base Python stable (base du système d'exploitation)
FROM python:3.11-slim

# Étape 2: Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Étape 3: Copier le fichier requirements.txt et installer les dépendances
# Ceci permet de mettre en cache cette étape si le fichier requirements.txt n'a pas changé
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Étape 4: Copier le reste du code de l'application
COPY . .

# Étape 5: Spécifier le port sur lequel l'application s'exécute
EXPOSE 5000

# Étape 6: Définir la commande de démarrage de l'application
# Remplacez 'app.py' par le nom de votre fichier d'entrée Flask
CMD ["python", "app.py"]
