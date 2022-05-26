library(shiny)

navbarPage(
  "Naics Code Analyzer",
  tabPanel(
    "Upload a text file with the business description",
    fluidPage(
      wellPanel(p("Please upload a text file of the business description."),
                p("When finished, please download or copy your result.")),
      fluidRow(
        # Upload business description
        column(fileInput("uploaded_business_description",
                       label = h5("Upload your data")),
                       width =  6),
      ),
      
      # Download section 
      fluidRow(
           downloadButton("download_code_bs_similarity_6digit",
                         "Download result of similarity score of 6 digit"),
          downloadButton("download_code_bs_similarity_4digit",
                         "Download result of similarity score of 4 digit"),
          downloadButton("download_code_bs_similarity_2digit",
                         "Download result of similarity score of 2 digit")
      ),
      fluidRow(
        mainPanel(
          tabsetPanel(
            id = 'dataset',
            tabPanel("Industry_code_for_6_digit",DT::dataTableOutput("table_6_digit")),
            tabPanel("Industry_code_for_4_digit",DT::dataTableOutput("table_4_digit")),
            tabPanel("Industry_code_for_2_digit",DT::dataTableOutput("table_2_digit"))
          )
        ,width = 12
          )
      )
    )
  ),
  collapsible = TRUE
)
