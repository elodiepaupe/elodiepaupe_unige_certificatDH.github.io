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
    
    
    <xsl:template match="/">
        <root>
            <xsl:apply-templates/> 
        </root>
    </xsl:template>
    
    
    <xsl:template match="w">
        <xsl:choose>
            <!-- Rendre les div -->
            <xsl:when test="text()='₳'">
                <xsl:text>&lt;div&gt;</xsl:text>
            </xsl:when>
            
            <xsl:when test="text()='₦'">
                <xsl:text>&lt;div type="ID"&gt;</xsl:text>
            </xsl:when>
           
            <xsl:when test="text()='$'">
                <xsl:text>&lt;div type="MainZone"&gt;</xsl:text>
            </xsl:when>
            
            <xsl:when test="text()='₭'">
                <xsl:text>&lt;div type="MarginTextZone"&gt;</xsl:text>
            </xsl:when>
            
            <xsl:when test="text()='₲'">
                <xsl:text>&lt;/div&gt;</xsl:text>
            </xsl:when>
            
            <!-- Rendre les groupes de lignes -->
            
            <xsl:when test="text()='¥'">
                <xsl:text>&lt;lg&gt;</xsl:text>
            </xsl:when>
            
            <xsl:when test="text()='¢'">
                <xsl:text>&lt;/lg&gt;</xsl:text>
            </xsl:when>
            
            <!-- Changer les lignes -->
            
            <xsl:when test="text()='£'">
                <xsl:text>&lt;l ana="HeadingLine"&gt;</xsl:text>
            </xsl:when>
            
            <xsl:when test="text()='₩'">
                <xsl:text>&lt;l ana="DefaultLine"&gt;</xsl:text>
            </xsl:when>
            
            <xsl:when test="text()='₮'">
                <xsl:text>&lt;l ana="InterlinearLine"&gt;</xsl:text>
            </xsl:when>
            
            <xsl:when test="text()='₽'">
                <xsl:text>&lt;/l&gt;</xsl:text>
            </xsl:when>
            
            
            <xsl:otherwise>
                <xsl:element name="w">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:attribute name="lemma">
                        <xsl:value-of select="@lemma"/>
                    </xsl:attribute>
                    <xsl:attribute name="type">
                        <xsl:value-of select="@type"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
        
    
</xsl:stylesheet>