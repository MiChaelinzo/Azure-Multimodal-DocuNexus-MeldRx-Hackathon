
# Azure-Multimodal-DocuNexus-MeldRx-Hackathon

A demo repository for the Azure AI Multimodal Hackathon showcasing the integration of Microsoft Azure developer tools with advanced multimodal medical data analysis. This project demonstrates how DocuNexus AGI-Agent leverages Azure Cognitive Services, Machine Learning, and DevOps to transform raw clinical data into actionable insights.

## Overview

**DocuNexus AGI-Agent** is an AI-powered platform that:
- **Processes Multimodal Medical Data:**  
  Analyzes various file types including CCDA, DICOM, HL7, PDF, and CSV.
- **Leverages Azure Cognitive Services:**  
  Uses Azure Speech SDK for text-to-speech and Azure Computer Vision for real-time image analysis.
- **Integrates with MeldRx:**  
  Seamlessly connects with MeldRx FHIR APIs for enhanced clinical data automation.
- **Features Multimodal Inputs:**  
  Incorporates inputs from file uploads, live webcam feeds, and screen shares to generate comprehensive reports.

## Repository Structure

```
.
├── app.py                      # Main Streamlit application entry point
├── dicomread.py                # Module for DICOM file reading and processing
├── ai_models
│   └── azure_openai_integration.py  # Azure OpenAI integration for AI-powered insights
├── data
│   └── example_pdf_report.pdf  # Sample PDF report for demonstration
├── infrastructure
│   └── providers.tf            # Terraform configuration for Azure infrastructure provisioning
├── azure-pipelines.yml         # CI/CD pipeline configuration using Azure DevOps
├── requirements.txt            # Python dependencies list
├── .gitignore                  # Git ignore rules
├── LICENSE                     # MIT License
└── README.md                   # This README file
```

## Getting Started

### Prerequisites

- **Python 3.8+**  
- An active **Azure Subscription** with access to Azure Cognitive Services and Azure Machine Learning  
- [Streamlit](https://streamlit.io/) installed (if running locally)  
- [Terraform](https://www.terraform.io/) (optional, for infrastructure setup)  

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/MiChaelinzo/Azure-Multimodal-DocuNexus-MeldRx-Hackathon.git
    cd Azure-Multimodal-DocuNexus-MeldRx-Hackathon
    ```

2. **Create and activate a virtual environment:**

    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use: venv\Scripts\activate
    ```

3. **Install the dependencies:**

    ```bash
    pip install -r requirements.txt
    ```

4. **Configure Azure Credentials:**  
   Set your Azure subscription key, region, and other credentials using environment variables or Streamlit’s secrets management.

5. **Run the Application:**

    ```bash
    streamlit run app.py
    ```

## Using the App

- **Web Interface:**  
  Launch the application and interact with a dashboard that allows you to upload medical files, perform real-time analysis, and generate downloadable PDF reports.
  
- **Mobile Experience:**  
  To experience the mobile version, visit [https://meldrx.streamlit.app/](https://meldrx.streamlit.app/) on your smartphone, open the settings (three horizontal lines at the bottom-right), and select "Add the current page to Home Screen".

- **CI/CD Pipeline:**  
  Check out the `azure-pipelines.yml` file for automated testing and deployment using Azure DevOps.

## Leveraging Azure Developer Tools

Our project accelerated development and enhanced capabilities by integrating a comprehensive suite of Azure tools:

- **Azure Cognitive Services:**
  - **Speech SDK:** Rapidly deployed an enterprise-grade text-to-speech solution that voices the AI analysis.
  - **Computer Vision:** Enabled accurate analysis of live images from webcams and screen shares.

- **Azure Machine Learning:**
  - Integrated pre-trained models and scalable pipelines to support predictive analytics and synthetic data generation.

- **Azure DevOps:**
  - Utilized CI/CD pipelines (via `azure-pipelines.yml`) for continuous build, test, and deployment—ensuring a robust production workflow.

- **Azure Cloud Infrastructure:**
  - Built on an Azure HIPAA-compliant framework that guarantees data security through military-grade encryption and secure access management.

## Contributing

Contributions, enhancements, and issue reports are welcome! Please submit a pull request or create an issue on the [GitHub issues page](https://github.com/MiChaelinzo/Azure-Multimodal-DocuNexus-MeldRx-Hackathon/issues).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **Microsoft Azure:** For providing state-of-the-art cloud services and developer tools.
- **MeldRx Team:** For inspiration and API integrations that drive clinical data innovation.
- **Open-Source Community:** For their continual contributions to advancing healthcare AI technologies.

```

