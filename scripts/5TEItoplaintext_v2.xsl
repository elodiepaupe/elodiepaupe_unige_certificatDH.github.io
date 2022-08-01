<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
    schematypens="http://purl.oclc.org/dsdl/schematron"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <!-- Créer la div qui englobe chaque page -->
        <xsl:text>₳ </xsl:text>
        <!-- Créer un identifiant pour chaque texte = Heading0 -->
        <xsl:text>₦ </xsl:text><xsl:value-of select="substring(//pb/@facs,30,17)"/><xsl:text> ₲</xsl:text><xsl:text>
        </xsl:text>
        
        <!-- Créer le contenu à réimporter dans le fichier tei -->
        <xsl:apply-templates select="//div[@type='MainZone'] | //div[@type='MainZone:column']"/>

        <xsl:apply-templates select="//div[@type='notes_marginales_auteur']"/>

        <xsl:text> ₲</xsl:text>
    </xsl:template>
    
    
    <!-- Créer les éléments non lemmatisables qui permettront ensuite de recréer la structure de la page de base avec div; lg et l. -->
    <xsl:template match="div[@type='MainZone'] | div[@type='MainZone:column']">
        <xsl:text>$ </xsl:text>
            <xsl:apply-templates/>
        <xsl:text> ₲</xsl:text>
    </xsl:template>
    
    <xsl:template match="lg">
        <xsl:text> ¥ </xsl:text>
        <xsl:value-of select="@xml:id"/>
            <xsl:apply-templates/>
        <xsl:text> ¢
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="l[@ana='HeadingLine']">
        <xsl:text>£ </xsl:text>
            <xsl:apply-templates/>
        <xsl:text> ₽
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="l[@ana='DefaultLine']">
        <xsl:text> ₩ </xsl:text>
            <xsl:apply-templates/>
        <xsl:text> ₽
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="l[@ana='InterlinearLine']">
        <xsl:text>₮ </xsl:text>
            <xsl:apply-templates/>
        <xsl:text> ₽
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="div[@type='MarginTextZone']">
        <xsl:text>₭ </xsl:text>
            <xsl:apply-templates/>
        <xsl:text> ₲
        </xsl:text>
    </xsl:template>
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="div[@type='notes_marginales_archives']"/>
    
    
</xsl:stylesheet>