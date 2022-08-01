<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml"
    schematypens="http://purl.oclc.org/dsdl/schematron"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <!-- Permet de copier le document -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>   
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="title">
        <xsl:apply-templates/>
        
        <!-- Créer la variable qui permettra d'interroger la base de données: ici le nom du fichier -->
        <xsl:variable name="filename">
            <xsl:value-of select="concat(//pb/@n,'.jpg')"/>
        </xsl:variable>
        
        <!-- Rechercher la donnée à importer de la base de donnée -->
        <xsl:variable name="cote">
            <xsl:copy-of select= "document('../4TEI/recolement.xml')/root/row[Heading5=$filename]/Heading12" xpath-default-namespace=""/>    
        </xsl:variable>
        
        <!-- Insérer cette donnée dans le fichier TEI -->
        <title xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:value-of select="$cote"/>
        </title>
       
    </xsl:template>
    
    <!-- Même démarche que ci-dessus, mais pour compléter la cote du document. -->
    <xsl:template match="idno[@type='cote']">
        <xsl:apply-templates/>

        <xsl:variable name="filename">
            <xsl:value-of select="concat(//pb/@n,'.jpg')"/>
        </xsl:variable>
        
        <xsl:variable name="cote">
            <xsl:copy-of select= "document('../4TEI/recolement.xml')/root/row[Heading5=$filename]/Heading12" xpath-default-namespace=""/>    
        </xsl:variable>
        
        <idno xmlns="http://www.tei-c.org/ns/1.0" type="cote">
            <xsl:value-of select="$cote"/>
        </idno>
         
    </xsl:template>
    
    
    <!-- Même démarche pour l'url de graphique -->
    <xsl:template match="graphic">
        <xsl:apply-templates/>
        
        <xsl:variable name="filename">
            <xsl:value-of select="concat(//pb/@n,'.jpg')"/>
        </xsl:variable>
        
        <xsl:variable name="graph">
            <xsl:copy-of select= "document('../4TEI/recolement.xml')/root/row[Heading5=$filename]/Heading3" xpath-default-namespace=""/>    
        </xsl:variable>

            <graphic xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="url">
                    <xsl:value-of select="$graph"/>
                </xsl:attribute>
            </graphic>

    </xsl:template>
    
    <!-- L'url est aussi ajouté à l'élément <pb>: on l'a ainsi dans. -->
    <xsl:template match="pb">
        <xsl:apply-templates/>
        
        <xsl:variable name="filename">
            <xsl:value-of select="concat(//pb/@n,'.jpg')"/>
        </xsl:variable>
        
        <xsl:variable name="facs">
            <xsl:copy-of select="document('../4TEI/recolement.xml')/root/row[Heading5=$filename]/Heading3" xpath-default-namespace=""/>    
        </xsl:variable>
        
        <xsl:copy>
            <xsl:attribute name="facs">
                <xsl:value-of select="$facs"/>
            </xsl:attribute>
        </xsl:copy>
        
    </xsl:template>
    
    
    <!-- Même démarche pour créer le lien vers l'image IIIF. -->
    <xsl:template match="zone">
        
        <xsl:variable name="filename">
            <xsl:value-of select="concat(//pb/@n,'.jpg')"/>
        </xsl:variable>
        
        <xsl:variable name="source">
            <xsl:copy-of select= "document('../4TEI/recolement.xml')/root/row[Heading5=$filename]/Heading3" xpath-default-namespace=""/>    
        </xsl:variable>
        
        <!-- On copie les attributs de l'élément zone et on en ajoute un. -->
        <xsl:copy>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="corresp">
                <xsl:value-of select="@corresp"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:attribute name="points">
                <xsl:value-of select="@points"/>
            </xsl:attribute>
            <!-- Ici, j'assemble le début de l'url des images IIIF avec la valeur de l'attribut source. 
            On a ainsi un url qui renvoie à la zone précise.-->
            <xsl:attribute name="source">
                <xsl:value-of select="concat(substring($source,1,46),@source)"/>
            </xsl:attribute> 
            <!-- L'apply-templates passe dans le xsl:copy pour qu'il copie les éléments enfants de <zone> à l'intérieur de celui-ci. -->
            <xsl:apply-templates/>
        </xsl:copy>
        
    </xsl:template>
    
    
</xsl:stylesheet>