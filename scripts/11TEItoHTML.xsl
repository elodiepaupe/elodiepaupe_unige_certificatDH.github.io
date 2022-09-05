<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>


    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        
        <!-- Création de la page HTML -->
        <html lang="fr">
            <!-- Head commun à toutes les pages -->
            <head>
                <title>Projet Crimes et Châtiments</title>
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
                <link rel="stylesheet" href="../style/feuilledestyle.css"/>
                
                <meta name="keywords"
                    content="Bâle, procédures criminelles, sorcellerie, sorcière, évêché de Bâle"/>
                <meta name="description"
                    content="Procédures criminelles de la principauté épiscopale de Bâle (16-17e siècles)"/>
                <meta name="author" content="Elodie Paupe"/>
                <meta name="viewport"
                    content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
                <script src="../scripts/script.js"/>

            </head>

            <body>
                <!-- Menus de navigation principal -->
                <header>
                    <!-- En-tête du site des aaeb: 
              <img id="logo" src="http://aaeb.ch/htdocs/images/header.jpg"/> -->
                    <a href="../index.html">
                        <img id="logo" src="../site/photos/logo_bis.png" alt="logo"/>
                    </a>
                    <nav id="primary_nav_wrap">
                        <ul>
                            <li class="current-menu-item">
                                <a href="../index.html">Accueil</a>
                            </li>
                            <li>
                                <a href="#">Description du projet</a>
                                <ul>
                                    <li>
                                        <a href="../site/description_projet.html">"Crimes et
                                            Châtiments"</a>
                                    </li>
                                    <li>
                                        <a href="../site/calendrier.html">Calendrier du projet</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Ressources</a>
                                <ul>
                                    <li>
                                        <a href="../site/modele_HTR.html">Modèles HTR</a>
                                    </li>
                                    <li>
                                        <a href="../site/bdd_cod205a.html">Base de données: Cod.205a</a>
                                    </li>
                                    <li>
                                        <a href="../site/bdd_sorciere.html">Base de données: socières</a>
                                    </li>
                                    <li>
                                        <a href="../site/abecedaire.html">Abécédaire</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Accéder aux sources</a>
                                <ul>
                                    <li>
                                        <a href="../site/lecture.html">Lire les sources</a>
                                    </li>
                                    <li>
                                        <a href="../site/infographie.html">Infographie</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="../site/liens.html">Liens</a>
                            </li>
                        </ul>
                    </nav>
                </header>

                <!-- Début de la page -->
                <h1>Salle de lecture virtuelle</h1>
                <h2> <xsl:value-of select="//idno[@type='cote']"/></h2>
                
                <!-- Création du menu déroulant pour sélectionner les dossiers. -->
                <nav id="salle_lecture">
                    <ul>
                        <li class="deroulant">
                            <a href="#">Sélectionner le dossier</a>
                            <ul>
                                <li>
                                    <a href="B_168_15-2-1_0001.html">B 168/15-2.1 - Information
                                        secrète contre Annelin Boulay</a>
                                </li>
                                <li>
                                    <a href="B_168_15-2-2_0001.html">B 168/15-2.2 - Informations
                                        levées d'office par le prévôt de Porrentruy Henri Farine et
                                        le maire de Courtedoux Claudat Bruat (Briot?)</a>
                                </li>
                                <li>
                                    <a href="B_168_15-2-3_0001.html">B 168/15-2.3 - Interrogatoires
                                        d'Annelin Boulay</a>
                                </li>
                                <li>
                                    <a href="B_168_15-2-4_0001.html">B 168/15-2.4 - Urphède
                                        d'Annelin Boulay</a>
                                </li>
                                <li>
                                    <a href="B_168_15-9-2_0001.html">B 168/15-9.2 – Informations
                                        levées contre Agathe Voélin (dépositions des témoins)</a>
                                </li>
                                <li>
                                    <a href="B_168_15-9-4_0001.html">B 168/15-9.4 – Aveux définitifs
                                        d'Agathe Voélin – résumés de ses aveux des 17, 20, 26 et 31
                                        août</a>
                                </li>
                                <li>
                                    <a href="B_168_15-10-3_0001.html">B 168/15-10.3 - Aveux
                                        définitifs d'Aignelatte Thiebault résumant ses aveux des 18,
                                        20, 26 et 31 août</a>
                                </li>
                                <li>
                                    <a href="B_168_15-23-1_0001.html">B 168/15-23.1 - Résumé des
                                        griefs contre Adelheid Bourquin et Alix Rossel</a>
                                </li>
                                <li>
                                    <a href="B_168_15-23-2_0001.html">B 168/15-23.2 -
                                        Interrogatoires d'Adelheid Bourquin</a>
                                </li>
                                <li>
                                    <a href="B_168_15-23-3_0001.html">B 168/15-23.3 - Aveux
                                        définitifs d'Adelheid Bourquin</a>
                                </li>
                                <li>
                                    <a href="B_168_15-23-4_0001.html">B 168/15-23.4 -
                                        Interrogatoires d'Alix Rossel</a>
                                </li>
                                <li>
                                    <a href="B_168_15-23-5_0001.html">B 168/15-23.5 - Aveux
                                        définitifs d'Alix Rossel</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>

                <!-- Boutons de navigation pour passer d'une page à l'autre: pas encore automatisé. -->
                <div class="bouton_lecture w3-center">
                    <div class="w3-bar">
                        <a href="#" class="w3-button w3-blue w3-hover-white">1</a>
                        <a href="#" class="w3-button w3-blue w3-hover-white">2</a>
                        <a href="#" class="w3-button w3-blue w3-hover-white">3</a>
                    </div>
                </div>

                <!-- Création de la zone de lecture à gauche -->
                <div class="lecture">
                    <div class="lecture_transcription">
                        <xsl:apply-templates select="//div[@type = 'MainZone']"/>
                        <xsl:for-each select="//div[@type='MainZone:column']">
                            <div>
                                <xsl:text>[colonne]</xsl:text>
                                <xsl:apply-templates/>
                            </div>
                        </xsl:for-each>
                    </div>

                    <!-- Création de la zone de facsimilé à droite. -->
                    <iframe class="lecture_image">
                        <xsl:attribute name="src">

                            <xsl:variable name="filename">
                                <xsl:value-of select="//pb/@facs"/>
                            </xsl:variable>

                            <!-- Les images IIIF sont appelées pour chaque transcription. -->
                            <xsl:variable name="contenu">
                                <xsl:copy-of
                                    select="document('../4TEI/recolement.xml')/root/row[Heading3 = $filename]/Heading4"
                                    xpath-default-namespace=""/>
                            </xsl:variable>

                            <xsl:value-of select="$contenu"/>

                        </xsl:attribute>
                    </iframe>

                </div>

                <!-- Bas de page commun à tout le monde. -->
                

                <footer>
                    <p>Archives de l'ancien Évêché de Bâle – <a
                            href="mailto:jean-claude.rebetez@aaeb.ch">Nous écrire</a></p>
                    <p>2022 - Tous droits réservés.</p>

                </footer>
            </body>

        </html>
    </xsl:template>

    <xsl:template match="teiHeader"/>
    
    <xsl:template match="div[@type='MainZone']/lg">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Gestion des lignes -->
    <xsl:template match="l">
        <xsl:choose>
            <xsl:when test="ancestor::div[@type='MainZone']">
                <xsl:choose>
                    <xsl:when test="@ana = 'DefaultLine'">
                          <span>
                                <xsl:apply-templates/>
                          </span><br/>   
                    </xsl:when>
                    <xsl:when test="@ana = 'HeadingLine'">
                           <span class="heading_line">
                                <i><xsl:apply-templates/></i><br/>
                            </span>
                    </xsl:when>
                    <xsl:when test="@ana = 'InterlinearLine'">
                        <span class="interlinear_line"><xsl:apply-templates/></span>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/><xsl:text> </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <!-- Pour biffer les lignes marquées comme telles. -->
    <xsl:template match="del">
        <span style="text-decoration: line-through;"><xsl:apply-templates/></span>
    </xsl:template>
    
    <!-- Les ajouts qui n'ont pas été identifés comme des interlignes -->
    <xsl:template match="add">
        <xsl:choose>
            <xsl:when test="@place='above'">
                <sup><xsl:apply-templates/></sup>
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>

    <xsl:template match="w">
        <xsl:value-of select="."/><xsl:text> </xsl:text>
    </xsl:template>
    
    <!-- Les notes de l'auteur sont placées dans le texte. -->
    <xsl:template match="ref">
        <xsl:variable name="reference">
            <xsl:value-of select="@target"/>
        </xsl:variable>
        
        <span class="note_ajoute">
            <xsl:text>(</xsl:text><xsl:apply-templates select="//lg[@xml:id = substring($reference,2)]"/><xsl:text>)</xsl:text>
        </span>
        
    </xsl:template>
</xsl:stylesheet>