<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:alto="http://www.loc.gov/standards/alto/ns-v4#"
    xpath-default-namespace="http://www.loc.gov/standards/alto/ns-v4#" version="2.0"
    exclude-result-prefixes="xs">
    <xsl:output encoding="UTF-8" method="xml" indent="yes" omit-xml-declaration="yes"
        xpath-default-namespace="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
        <?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
    schematypens="http://purl.oclc.org/dsdl/schematron"?>
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader xml:lang="fr">
                <fileDesc>
                    <titleStmt>
                        <title><!-- Données reprises au csv dans l'étape suivante. --></title>
                    </titleStmt>
                    <editionStmt>
                        <edition>Version électronique TEI des procédures criminelles de la principauté épiscopale de Bâle</edition>   
                        <respStmt> 
                            <name xml:id="EP">Élodie Paupe</name>
                            <resp>Encodage</resp>
                        </respStmt>
                    </editionStmt>
                    <publicationStmt>
                        <authority>Archives de l'ancien Évêché de Bâle</authority>
                        <address>
                            <addrLine>rue des Annonciades 10</addrLine>
                            <addrLine>2900 Porrentruy</addrLine>
                            <addrLine>www.aaeb.ch</addrLine>
                        </address>
                        <availability status="restricted" n="CC-BY-NC-SA">
                            <licence target="https://creativecommons.org/licenses/by-nc-sa/4.0/"/>
                            <p>Creative Commons Attribution 4.0 CC BY-NC-SA 4.0 FR</p>
                        </availability>
                    </publicationStmt>
                    <sourceDesc>
                        <msDesc>
                            <msIdentifier>
                                <country>Suisse</country>
                                <settlement>Porrentruy</settlement>
                                <repository>Archives de l'ancien Évêché de Bâle</repository>
                                <idno type="cote"><!-- Récupérer la cote des documents et du dossier en supprimant la fin. --></idno>
                                <idno type="url">https://archives-aaeb.jura.ch/detail.aspx?ID=223582</idno>
                            </msIdentifier>
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <ab source="https://github.com/aaeb-porrentruy/corpus_prevot_farine_fr/blob/main/README.md">Les normes de transcription sont disponibles en ligne.</ab>
                </encodingDesc>
                <profileDesc>
                    <langUsage>
                        <language ident="fr">Moyen français</language>
                    </langUsage>
                </profileDesc> 
                <revisionDesc>
                    <xsl:element name="change">
                        <xsl:attribute name="when">
                            <xsl:value-of select="format-date(current-date(),'[Y0001]-[M01]-[D01]')"/>
                        </xsl:attribute>
                        <xsl:attribute name="who">
                            <xsl:text>#EP</xsl:text>
                        </xsl:attribute>
                        <xsl:text>Création du fichier TEI à partir des sources alto</xsl:text>
                    </xsl:element>
                </revisionDesc> 
            </teiHeader>
            
            <sourceDoc xml:id="transcription">
                <!-- Page -->
                <xsl:for-each select="//alto">
                    <xsl:element name="surface">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="substring-before(self::alto/Description/sourceImageInformation/fileName, '.')"/>
                        </xsl:attribute>
                        <!-- Lien vers l'image -->
                        <xsl:element name="graphic">
                            <xsl:attribute name="url">
                                <!-- Aller chercher l'information dans le fichier csv. --> 
                            </xsl:attribute>
                        </xsl:element>
                        <!-- Zones de texte -->
                        <xsl:for-each select="//TextBlock">
                            <xsl:element name="zone">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@ID"/>
                                </xsl:attribute>
                                <xsl:attribute name="type">
                                    <xsl:text>segmontoZone</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="corresp">
                                    <!-- Attraper la valeur codée -->
                                    <xsl:variable name="type_zone">
                                        <xsl:value-of select="@TAGREFS"/>
                                    </xsl:variable>
                                    <!-- Recherche de la véritable valeur exprimée -->
                                    <xsl:variable name="type_zone_valeur">
                                        <xsl:value-of select= "//OtherTag[@ID=$type_zone]/@LABEL"/>    
                                    </xsl:variable>
                                    <xsl:value-of select="$type_zone_valeur"/>
                                </xsl:attribute>
                                <xsl:attribute name="n">
                                    <xsl:number level="single" count="." format="1"/>
                                </xsl:attribute>
                                <xsl:attribute name="points">
                                    <xsl:variable name="value"
                                        select="./Shape/Polygon/@POINTS"/>
                                    <xsl:analyze-string select="$value"
                                        regex="([0-9]+)\s([0-9]+)">
                                        <xsl:matching-substring>
                                            <xsl:for-each select="$value">
                                                <xsl:value-of select="regex-group(1)"/>
                                                <xsl:text>,</xsl:text>
                                                <xsl:value-of select="regex-group(2)"/>
                                                <xsl:text> </xsl:text>
                                            </xsl:for-each>
                                        </xsl:matching-substring>
                                    </xsl:analyze-string>
                                </xsl:attribute>
                                <xsl:attribute name="source">
                                    <!-- Aller chercher le code de l'image d'après le csv.-->
                                    <xsl:text>/</xsl:text>
                                    <xsl:value-of select="@HPOS"/>
                                    <xsl:text>,</xsl:text>
                                    <xsl:value-of select="@VPOS"/>
                                    <xsl:text>,</xsl:text>
                                    <xsl:value-of select="@WIDTH"/>
                                    <xsl:text>,</xsl:text>
                                    <xsl:value-of select="@HEIGHT"/>
                                    <xsl:text>/full/0/default.jpg</xsl:text>
                                </xsl:attribute>
                                <!-- Ajouter les lignes -->
                                <xsl:for-each select="TextLine">
                                    <xsl:element name="zone">
                                        <xsl:attribute name="xml:id">
                                            <xsl:value-of select="@ID"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="type">
                                            <xsl:text>segmontoLine</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="corresp">
                                            <!-- Attraper la voiture -->
                                            <xsl:variable name="type_zone">
                                                <xsl:value-of select="@TAGREFS"/>
                                            </xsl:variable>
                                            
                                            <!-- Recherche de la véritable valeur -->
                                            <xsl:variable name="type_zone_valeur">
                                                <xsl:value-of select= "//OtherTag[@ID=$type_zone]/@LABEL"/>    
                                            </xsl:variable>
                                            
                                            <xsl:value-of select="$type_zone_valeur"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="n">
                                            <xsl:number level="single" count="." format="1"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="points">
                                            <xsl:variable name="value" select="./Shape/Polygon/@POINTS"/>
                                            <xsl:analyze-string select="$value"
                                                regex="([0-9]+)\s([0-9]+)">
                                                <xsl:matching-substring>
                                                    <xsl:for-each select="$value">
                                                        <xsl:value-of select="regex-group(1)"/>
                                                        <xsl:text>,</xsl:text>
                                                        <xsl:value-of select="regex-group(2)"/>
                                                        <xsl:text> </xsl:text>
                                                    </xsl:for-each>
                                                </xsl:matching-substring>
                                            </xsl:analyze-string>
                                        </xsl:attribute>
                                        <xsl:attribute name="source">
                                            <!-- Le début de l'adresse est importé à partir du csv.-->
                                            <xsl:text>/</xsl:text>
                                            <xsl:value-of select="@HPOS"/>
                                            <xsl:text>,</xsl:text>
                                            <xsl:value-of select="@VPOS"/>
                                            <xsl:text>,</xsl:text>
                                            <xsl:value-of select="@WIDTH"/>
                                            <xsl:text>,</xsl:text>
                                            <xsl:value-of select="@HEIGHT"/>
                                            <xsl:text>/full/0/default.jpg</xsl:text>
                                        </xsl:attribute>
                                        <!-- Baseline -->
                                        <xsl:element name="path">
                                            <xsl:variable name="nbaseline">
                                                <xsl:number level="single" count="." format="1"/>
                                            </xsl:variable>
                                            <xsl:attribute name="n">
                                                <xsl:value-of select="$nbaseline"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="xml:id">
                                                <xsl:value-of select="concat(@ID,'_baseline_',$nbaseline)"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="type">
                                                <xsl:text>baseline</xsl:text>
                                            </xsl:attribute>
                                            <xsl:attribute name="points">
                                                <xsl:variable name="value" select="@BASELINE"/>
                                                <xsl:analyze-string select="$value"
                                                    regex="([0-9]+)\s([0-9]+)">
                                                    <xsl:matching-substring>
                                                        <xsl:for-each select="$value">
                                                            <xsl:value-of select="regex-group(1)"/>
                                                            <xsl:text>,</xsl:text>
                                                            <xsl:value-of select="regex-group(2)"/>
                                                            <xsl:text> </xsl:text>
                                                        </xsl:for-each>
                                                    </xsl:matching-substring>
                                                </xsl:analyze-string>
                                            </xsl:attribute>
                                        </xsl:element>
                                        <!-- Ajouter la transcription -->
                                        <xsl:element name="line">
                                            <xsl:variable name="nline">
                                                <xsl:number level="single" count="." format="1"/>
                                            </xsl:variable>
                                            <xsl:attribute name="xml:id">
                                                <xsl:value-of select="concat(@ID,'_ligne_',$nline)"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="String/@CONTENT"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each> 
            </sourceDoc>
            
            <text>
                <body>
                    <xsl:for-each select="//alto">
                        <!-- Éditer la page -->
                        <xsl:element name="div">
                            <xsl:attribute name="n">
                                <xsl:value-of select="substring-before(substring(//fileName,1), '.')"/>
                            </xsl:attribute>
                            <xsl:attribute name="type">
                                <xsl:text>page</xsl:text>
                            </xsl:attribute>

                        <xsl:element name="pb">
                            <xsl:attribute name="n">
                                <xsl:value-of select="substring-before(substring(//fileName,1), '.')"/>
                            </xsl:attribute>
                            <!-- L'attribut @facs est associé à l'étape suivante. -->
                        </xsl:element>
                            
                            <!-- Éditer la zone de décoration -->
                            <div type="decoration">
                                <xsl:apply-templates select="//TextBlock[@TAGREFS='BT379']"/>
                            </div>
                            
                            <div type="texte_principal">
                                <!-- Éditer la zone de texte principale ou le texte en colonnes -->
                                <xsl:apply-templates select="//TextBlock[@TAGREFS='BT367'] | //TextBlock[@TAGREFS='BT365']"/>
                                <!-- Éditer les signatures lorsqu'elles sont là -->
                                <xsl:apply-templates select="//TextBlock[@TAGREFS='BT380']"/>
                                
                            </div>
                            
                            
                            <div type="notes_marginales">
                                <!-- Les annotations de Farine  -->
                                <div type="notes_marginales_auteur">
                                    <xsl:apply-templates select="//TextBlock[@TAGREFS='BT368']"/>
                                </div>
                                <!-- Les annotations d'archives  -->
                                <div type="notes_marginales_archives">
                                    <xsl:apply-templates select="//TextBlock[@TAGREFS='BT369'] | //TextBlock[@TAGREFS='BT370']"/>
                                </div>
                                <!-- Numéro de page  -->
                                <div type="notes_marginales_archives">
                                    <xsl:apply-templates select="//TextBlock[@TAGREFS='BT371']"/>
                                </div>
                            </div>
                        </xsl:element>
                    </xsl:for-each>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="MeasurementUnit"/>
    <xsl:template match="fileName"/>
   
    
    <xsl:template match="TextBlock">
        <!-- Valeur à aller récupérer-->
        <xsl:variable name="type_zone">
            <xsl:value-of select="@TAGREFS"/>
        </xsl:variable>
        <!-- Recherche de la véritable valeur -->
        <xsl:variable name="type_zone_valeur">
            <xsl:value-of select= "//OtherTag[@ID=$type_zone]/@LABEL"/>    
        </xsl:variable>
        <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="type">
                <xsl:value-of select="$type_zone_valeur"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="$type_zone_valeur='DecorationZone'">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <lg xmlns="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="concat(@ID,'_lg_',count(.))"/>
                        </xsl:attribute>
                        
                        <xsl:apply-templates/>       
                    </lg>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
        
    <xsl:template match="TextLine">
        <l xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="ana">
                <!-- Valeur à aller récupérer-->
                <xsl:variable name="type_ligne">
                    <xsl:value-of select="@TAGREFS"/>
                </xsl:variable>
                <!-- Recherche de la véritable valeur -->
                <xsl:variable name="type_ligne_valeur">
                    <xsl:value-of select= "//OtherTag[@ID=$type_ligne]/@LABEL"/>    
                </xsl:variable>
                <xsl:value-of select="$type_ligne_valeur"/>
            </xsl:attribute>
            <xsl:apply-templates select="String/@CONTENT"/>
        </l>   
    </xsl:template>
</xsl:stylesheet>