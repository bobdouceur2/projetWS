import json
import time
from selenium import webdriver

# Charger les liens des images à partir du fichier JSON
with open('ImageLinks.json', 'r') as json_file:
    image_links_dict = json.load(json_file)

# Initialiser le navigateur web
driver = webdriver.Chrome()

# Parcourir chaque lien dans le dictionnaire
for name, link in image_links_dict.items():
    # Ouvrir le lien dans une nouvelle fenêtre du navigateur
    driver.get(link)
    # Ajouter un délai entre chaque ouverture de lien pour éviter le blocage de l'IP
    time.sleep(1)

# Fermer le navigateur après avoir ouvert tous les liens
driver.quit()

print('Tous les liens ont été ouverts dans des pages Web.')
