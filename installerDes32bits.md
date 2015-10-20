# Installation de programmes en 32 bits sur une architecture en 64 bits et une distribution Jessie

Tutoriel testé sur ida-demo (le désassembleur de HexRay), skype (sans commentaires) et boomerang (un décompilateur)

## outils nécessaires:

    - ldd
    - dpkg
    - son cerveau

## IDA

    Tout d'abord, on télécharge le programme à telle adresse.

    Ensuite on le lance pour s'asssurer que le programme ne se lance pas et qu'on va galérer à trouver une solution.

    Nous pouvons alors relancer ida avec cette commande:

    ldd ./idaq

    On a une jolie liste de librairies partagées qui sont ou pas trouvées dans le système.

    Comme on a une architecture en 64 bits, il va bien sur manquer des librairies et on ne peut pas toujours les télécharger correctement via apt-get

    Il va falloir le faire à la main:

        Si vous êtes sur Wheezy, vous devrez activer les backports.

