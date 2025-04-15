<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="textcoll" as="document-node()+" select="collection('xml-output/?select=*.xml')"/>
    <xsl:output method="text" indent="yes"/>
    
    
   <xsl:template match="/">
        <!-- FOR EACH DOCUMENT IN MY COLLECTION -->
       <xsl:for-each select="$textcoll">
          <xsl:if test="//line[@type='music']"> 
              <!-- ebb: The next two lines set up a new output document with the same filename as the episode file,
           and set up a "result document" to output in a new directory>
           -->
           <xsl:variable name="filename" as="xs:string" select="tokenize(base-uri(), '/')[last()] ! substring-before(., '.xml')"/>
           <xsl:result-document method="text" indent="yes" href="music-only-xml/{$filename}.txt">
                
               <xsl:apply-templates select="//line[@type='music']"/>
           
           </xsl:result-document>
          </xsl:if>
       </xsl:for-each>
   </xsl:template>

    
    
</xsl:stylesheet>