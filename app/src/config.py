import uuid
from aws_lambda_powertools import Logger


logger = Logger()


def configure_logger(service_name: str, correlation_id: str):
    logger.service = service_name
    logger.log_uncaught_exceptions = True
    logger.set_correlation_id(correlation_id)


def get_correlation_id(event):
    correlation_id = ""

    if "body" in event:
        correlation_id = event["body"].get("correlationId")
    else:
        correlation_id = event.get("correlationId")
    
    if not correlation_id:
        return str(uuid.uuid4())
    
    return correlation_id