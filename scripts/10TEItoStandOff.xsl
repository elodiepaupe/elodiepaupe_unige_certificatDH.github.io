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
    
    <xsl:template match="node()|@*">
       
        <TEI xmlns="http://www.tei-c.org/ns/1.0"
            xmlns:alto="http://www.loc.gov/standards/alto/ns-v4#">   
        
        <xsl:copy-of select="teiHeader"/>
            
        <xsl:copy-of select="sourceDoc"/>
            
        <xsl:copy-of select="text"/>

            <xsl:element name="standOff"> 
                <xsl:element name="annotationBlock">
                        <xsl:element name="spanGrp">
                            <xsl:for-each select="//w">
                                <xsl:element name="span">
                                    <xsl:attribute name="target">
                                        <xsl:value-of select="concat('#',@xml:id)"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="ana">
                                        <xsl:value-of select="concat('#',@xml:id,'ling')"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:element>
                </xsl:element>
                    
                        <xsl:for-each select="//w">
                            <xsl:element name="fs">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="concat(@xml:id,'ling')"/>
                                </xsl:attribute>
                                <xsl:element name="f">
                                    <xsl:attribute name="name">
                                        <xsl:text>lemma</xsl:text>
                                    </xsl:attribute>
                                    <xsl:element name="string">
                                        <xsl:value-of select="@lemma"/> 
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="f">
                                    <xsl:attribute name="name">
                                        <xsl:text>pos</xsl:text>  
                                    </xsl:attribute>
                                    <xsl:element name="symbol">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="@type"/>
                                        </xsl:attribute>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:for-each> 
                    </xsl:element>
        </TEI>
    </xsl:template>
  
</xsl:stylesheet>