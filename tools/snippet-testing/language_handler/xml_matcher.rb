require 'nokogiri'

module LanguageHandler
  class XmlMatcher
    def self.match(xml_str1, xml_str2, excluded_nodes = [])
      new(xml_str1, excluded_nodes: excluded_nodes).match(xml_str2)
    end

    def initialize(xml_str, excluded_nodes: [])
      @xml = canonical_xml(xml_str)
      @excluded_nodes = excluded_nodes
    end

    def match(xml_str)
      match_nodes @xml.root, canonical_xml(xml_str).root
    end

    private

    def canonical_xml(xml_str)
      sanitized_xml = Nokogiri::XML(
        xml_str.gsub(/(\\n|\s)+/, ' ').gsub(/\> \</, '><')
      ).canonicalize
      Nokogiri::XML.parse(sanitized_xml)
    end

    def match_nodes(node1, node2)
      node2 = node2.child if node1.name != node2.name && exclude_node?(node2)
      node1.name == node2.name &&
        node1.node_type == node2.node_type &&
        match_node_attributes(node1, node2) &&
        match_node_contents(node1, node2)
    end

    def match_node_contents(node1, node2)
      if node1.type == Nokogiri::XML::Node::TEXT_NODE
        node1.text.strip == node2.text.strip
      else
        match_node_children(node1, node2)
      end
    end

    def exclude_node?(node)
      @excluded_nodes.include?(node.path)
    end

    def match_node_children(node1, node2)
      node1.children.length == node2.children.length &&
        node1.children.zip(node2.children).all? { |ns| match_nodes(*ns) }
    end

    def match_node_attributes(node1, node2)
      node_attributes_hash(node1) == node_attributes_hash(node2)
    end

    def node_attributes_hash(node)
      node.attribute_nodes.map { |attr| [attr.name, attr.value] }.to_h
    end
  end
end
