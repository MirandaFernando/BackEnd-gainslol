class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :league_id, :wimrate, :first_drag, :first_tower
end
