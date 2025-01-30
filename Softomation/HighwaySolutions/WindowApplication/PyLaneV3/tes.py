def get_exception_names(exc_codes):
    # Dictionary mapping EXCCODE to the corresponding name
    exception_map = {
        "00": "SUCCESS",
        "01": "HOT_LIST",
        "02": "EXEMPTED_VEHICLE_CLASS",
        "03": "LOW_BALANCE",
        "04": "INVALID_CARRIAGE",
        "05": "BLACKLIST",
        "06": "CLOSED_SURRENDERED"
    }
    
    # Split the comma-separated string into a list of EXCCODE values
    exc_code_list = exc_codes.split(',')
    
    # Get the name for each EXCCODE from the dictionary, or 'Unknown' if not found
    exception_names = [exception_map.get(code.strip(), "Unknown") for code in exc_code_list]
    
    # Join the exception names into a comma-separated string
    return ", ".join(exception_names)

# Example usage
exc_codes = "00"
exception_names = get_exception_names(exc_codes)
print(f"EXCCODE names: {exception_names}")
