# frozen_string_literal: true

class TablePlus
  module Utility
    def self.shared_connection_path
      @shared_connection_path ||= public_send "shared_connection_path_#{`uname -s`.chomp.downcase}"
    end

    def self.load_connections
      connections = Plist.parse_xml("#{shared_connection_path}/Connections.plist")
      connections.map { |c| TablePlus::Alfred::Connection.new(c) }
    end

    def self.load_connection_groups
      groups = Plist.parse_xml("#{shared_connection_path}/ConnectionGroups.plist")
      groups.map { |g| TablePlus::ConnectionGroup.new(g) }
    end

    def self.shared_connection_path_darwin
      packages = [
        'com.tinyapp.TablePlus-setapp',
        'com.tinyapp.TablePlus'
      ]

      packages.map do |pkg|
        output = `defaults read #{pkg} 2>/dev/null`
        next unless $CHILD_STATUS.success?

        output = output.split("\n").find { |o| o.match(/SharedConnectionPath/) }
        output.match(/"(.+)"/)&.[](1) || "#{ENV['HOME']}/Library/Application Support/com.tinyapp.TablePlus/Data"
      end.compact.first
    end

    def self.find_group(group, output)
      cgs = TablePlus::Utility.load_connection_groups
      group = cgs.find { |cg| cg.id == group.group_id }
      return [group, output] unless group

      output += group.name
      output += '/' unless group.group_id.nil?
      find_group(group, output)
    end
  end
end
