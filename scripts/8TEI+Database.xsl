<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
    schematypens="http://purl.oclc.org/dsdl/schematron"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <!-- À appliquer sur les fichiers du dossier 6TEI+csv pour intégrer les éléments contenus dans la base de données xml créée à partir des données linguistiques de Pyrrha. -->
    
    <!-- Pour copier le fichier d'origine. -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Remplacer le texte principal par les données lemmatisées. -->
    <xsl:template match="div[@type='texte_principal']">
        
        <!-- On crée une variable commune entre les deux documents. -->
        <xsl:variable name="filename">
            <xsl:value-of select="substring(//pb/@facs,30,17)"/>
        </xsl:variable>
        
        <!-- On récupère les données. -->
        <xsl:variable name="contenu">
            <xsl:copy-of select= "document('../9Database_lgxmlid/aaeb-procedures-criminelles-v7.xml')/root/div[child::div[@type='ID']/w=$filename]/div[@type='MainZone']" xpath-default-namespace=""/>    
        </xsl:variable>
        
       <!-- On copie les données dans la div. -->
        <xsl:copy>
          <xsl:apply-templates  mode="#current" select="$contenu"/>     
        </xsl:copy>

    </xsl:template>
    
    <!-- Même démarche que ci-dessus pour les notes marginales écrites par l'auteur. -->
    <xsl:template match="div[@type='notes_marginales_auteur']">
        
        <!-- Creating a variable with a information similar in booth documents *.jpeg -->
        <xsl:variable name="filename">
            <xsl:value-of select="substring(//pb/@facs,30,17)"/>
        </xsl:variable>
        
        <!-- Creating a variable for the information to copy -->
        <xsl:variable name="contenu">
            <xsl:copy-of select= "document('../9Database_lgxmlid/aaeb-procedures-criminelles-v7.xml')/root/div[child::div[@type='ID']/w=$filename]/div[@type='MarginTextZone']" xpath-default-namespace=""/>    
        </xsl:variable>

        <xsl:element name="div" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="type">
                <xsl:text>notes_marginales_auteur</xsl:text>
            </xsl:attribute>
           
            <xsl:apply-templates select="$contenu"/>
        </xsl:element>
       
    </xsl:template>
    
</xsl:stylesheet>