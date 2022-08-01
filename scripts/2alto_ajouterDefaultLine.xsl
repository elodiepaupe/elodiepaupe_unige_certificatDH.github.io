<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:alto="http://www.loc.gov/standards/alto/ns-v4#"
    xpath-default-namespace="http://www.loc.gov/standards/alto/ns-v4#"
    version="2.0"
    exclude-result-prefixes="xs alto">
    <xsl:output encoding="UTF-8"
        method="xml"
        indent="yes"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="TextLine">
        <xsl:choose>
            <xsl:when test="@TAGREFS">
                <xsl:copy-of select="."/>
            </xsl:when>

            <xsl:otherwise>
                <xsl:copy> 
                    <xsl:apply-templates select="@*"/>
                    <xsl:attribute name="TAGREFS">
                        <xsl:value-of select="'LT118'"/>
                    </xsl:attribute> 
                    <xsl:apply-templates/>
                </xsl:copy>  
                
            </xsl:otherwise>  
        </xsl:choose>
       
    </xsl:template>
            

</xsl:stylesheet>
