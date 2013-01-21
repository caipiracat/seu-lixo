ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML) 
ActiveSupport::XmlMini::PARSING.delete("symbol") 
ActiveSupport::XmlMini::PARSING.delete("yaml")

