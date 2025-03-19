from azure.ai.formrecognizer import DocumentAnalysisClient
from azure.core.credentials import AzureKeyCredential

# Azure Form Recognizer credentials
endpoint = "https://<your-resource-name>.cognitiveservices.azure.com/"
key = "<your-api-key>"

# Initialize Form Recognizer client
client = DocumentAnalysisClient(endpoint=endpoint, credential=AzureKeyCredential(key))

def analyze_clinical_document(file_path):
    with open(file_path, "rb") as file:
        document = file.read()

    poller = client.begin_analyze_document(
        "prebuilt-document",  # Use prebuilt model for general document analysis
        document
    )
    result = poller.result()

    # Extract and print key-value pairs
    for field in result.key_value_pairs:
        if field.key and field.value:
            print(f"Key: {field.key.content}, Value: {field.value.content}")

    # Extract and print tables (if present)
    for table in result.tables:
        for row in table.cells:
            print(f"Cell: {row.content}")

# Path to your XML file
file_path = "clinical_document.xml"
analyze_clinical_document(file_path)
