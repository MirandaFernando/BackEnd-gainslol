class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :league_id, :wims, :loses, :first_drag, :first_tower
end
