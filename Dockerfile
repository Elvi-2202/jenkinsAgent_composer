# Utilisation de l'image de base Jenkins inbound-agent
FROM jenkins/inbound-agent

# Passer à l'utilisateur root pour avoir les permissions nécessaires pour installer des paquets
USER root

# Mise à jour de la liste des paquets et installation de PHP
RUN apt update && apt install -y php

# Installation des extensions PHP nécessaires
RUN apt install -y php-curl php-xml zip unzip

# Installation de l'extension PHP pour gérer les chaînes de caractères multibytes
RUN apt install -y php-mbstring

# Téléchargement de l'installateur de Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    # Vérification de l'intégrité du fichier de l'installateur avec son hash
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"

# Lancer l'installation de Composer à partir du script téléchargé
RUN php composer-setup.php

# Supprimer l'installateur une fois que Composer est installé
RUN php -r "unlink('composer-setup.php');"

# Déplacer Composer vers le répertoire /usr/local/bin pour qu'il soit accessible globalement
RUN mv composer.phar /usr/local/bin/composer
