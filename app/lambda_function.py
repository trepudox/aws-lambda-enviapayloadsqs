from src.config import logger
from src.config import configure_logger
from src.config import get_correlation_id
from src.lambda_processor import process


def lambda_handler(event, context):
    correlation_id = get_correlation_id(event)

    configure_logger("EnviaPayloadSQS", correlation_id)

    logger.info("Evento recebido: %s", event)
    body = event["body"]

    return process(body)
