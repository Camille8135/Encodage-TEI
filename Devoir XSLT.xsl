<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

    <!-- Output = HTML -->
    <xsl:output method="html" indent="yes"/>
    <!-- Variables des fichiers de sortie-->
    <xsl:variable name="home">
        <xsl:value-of select="concat('Le_Tour_du_Monde_en_quatre-vingts_jours_home', '.html')"/>
    </xsl:variable>
    <xsl:variable name="chap12">
        <xsl:value-of select="concat('Le_Tour_du_Monde_en_quatre-vingts_jours_chapitre_12', '.html')"/>
    </xsl:variable>
    <xsl:variable name="personnages">
        <xsl:value-of select="concat('Le_Tour_du_Monde_en_quatre-vingts_jours_liste_personnages', '.html')"/>
    </xsl:variable>
    <xsl:variable name="lieux">
        <xsl:value-of select="concat('Le_Tour_du_Monde_en_quatre-vingts_jours_liste_lieux', '.html')"/>
    </xsl:variable>
    
    <!-- Variables avec les chemins de retour -->
    <xsl:variable name="return_home">
            <a href="{concat('./', $home)}">Page d'accueil </a> 
    </xsl:variable>
    
    <xsl:variable name="return_personnages">
            <a href="{concat('./', $personnages)}">Liste des personnages </a>
    </xsl:variable>
    
    <xsl:variable name="return_lieux">
            <a href="{concat('./', $lieux)}">Liste des lieux </a>
    </xsl:variable>
    
    <xsl:variable name="return_chap12">
            <a href="{concat('./', $chap12)}"> Chapitre 12 </a>
    </xsl:variable>
 
    <!-- Variable avec le head -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title><xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/title"/></title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/title"/><xsl:text> par </xsl:text><xsl:value-of select="//titleStmt/author"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/respStmt/persName"/>
                </xsl:attribute>
            </meta>
            <link rel="icon" type="image/x-icon" href="favicon.ico"/>
            <link rel="stylesheet" type="text/css" href="style.css"/>
        </head>
    </xsl:variable>
    
    <!-- Variable avec le footer--> 
    <xsl:variable name="footer">
        <footer>
            <p><xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/respStmt/resp"/></p>
        </footer>
    </xsl:variable>
    
    
    <!-- Variable barre de navigation -->
    <xsl:variable name="body_header">
        <header>
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Verne_Tour_du_Monde.jpg/500px-Verne_Tour_du_Monde.jpg" alt="édition Hetzel, le Tour du monde en quatre-vingts jours" class="img"/>
            <nav>
                <xsl:copy-of select="$return_home"/>
                <xsl:copy-of select="$return_chap12"/>
                <xsl:copy-of select="$return_personnages"/>
                <xsl:copy-of select="$return_lieux"/>
            </nav>
        </header>
    </xsl:variable>

    <!-- Variable titre de la page -->
    <xsl:variable name="body_title">
        <div class="up">
            <h1>
                <xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/title"/>
            </h1>
            <h2 class="author">
                <xsl:value-of select="//TEI/teiHeader/fileDesc/titleStmt/author"/>
            </h2>
        </div> 
    </xsl:variable>
    
    <!-- Template qui appelle les templates -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="chapitre_12"/>
        <xsl:call-template name="liste_personnages"/>
        <xsl:call-template name="liste_lieux"/>
    </xsl:template>

    <!-- Template de la page d'accueil -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_title"/> 
                        <h3>
                       <xsl:text>
                        Édition numérique du Chapitre 12 
                    </xsl:text></h3>
                            <p class="home"> Cet encodage a été réalisé à partir de la numérisation du Journal le Temps, disponible sur Gallica, et
                                présentant le roman-feuilleton Le tour du monde en 80 jours, écrit par Jules Vernes et publié en 1872.
                                Le texte a été transcrit fidèlement, l'orthographe et la ponctuation sont celles d'origines. 
                                Il a néanmoins été choisi, pour simplifier le confort de lecture, de matérialiser des paragraphes.</p>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Templates des chapitres -->
    <!-- Chapitre 12 -->
    <xsl:template name="chapitre_12">
        <xsl:result-document href="{$chap12}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_title"/>
                        <h3>
                            
                            <xsl:value-of select="upper-case(//div/head)"/>
                            
                        </h3>
                        <div class="chap12">
                            <xsl:for-each select="//div[@type='chapter']/p">
                                  <p>
                                      <xsl:value-of select="."/>
                                </p>
                            </xsl:for-each>
                        </div>
                       </main>       
                    
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Liste personnages -->
    <xsl:template name="liste_personnages">
        <xsl:result-document href="{$personnages}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_title"/>
                        <h3>Liste des personnages du Chapitre 12</h3>
                      <div class="index">
                            <xsl:for-each select="//listPerson/person">
                                <p>
                                    <xsl:value-of select="./persName"/>
                                    <xsl:if test="./note"> 
                                    <xsl:value-of select="./note"/>  
                                    </xsl:if>
                                </p>
                            </xsl:for-each>
                      </div>
                    </main>
                        <xsl:copy-of select="$footer"/>
                   </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!--Liste lieux -->
    <xsl:template name="liste_lieux">
        <xsl:result-document href="{$lieux}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                
                <body>
                    <xsl:copy-of select="$body_header"/>
                    <main>
                        <xsl:copy-of select="$body_title"/>
                        <h3> Liste des lieux du Chapitre 12</h3>
                        <div class="index">
                        <xsl:for-each select=".//listPlace/place">
                        <p>
                           <xsl:value-of select="./placeName/name"/>
                           <xsl:value-of select=".//note"/>
                        </p>  
                        </xsl:for-each>
                      </div>    
                    </main>
                    <xsl:copy-of select="$footer"/> 
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>