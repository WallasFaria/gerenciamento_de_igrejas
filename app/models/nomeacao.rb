class Nomeacao < ActiveRecord::Base
  belongs_to :membro
  belongs_to :ministerio
end
