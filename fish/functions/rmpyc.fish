function rmpyc
    find -name "*.pyc" -delete
    find -name "__pycache__" -type d -delete
end
