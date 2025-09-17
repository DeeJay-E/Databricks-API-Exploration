#Make Databricks connection
from databricks.connect import DatabricksSession
import os
token = open("secrets/token").read()
URL = open("secrets/URL").read()
#Explicit configuration
def connect_explicit():
    """Connect with explicit configuration"""
    spark = (DatabricksSession.builder
             .host(URL)
             .token(token)
             .serverless(True)
             .getOrCreate())
    return spark