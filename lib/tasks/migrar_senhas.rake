#encoding: utf-8
namespace :app do
	desc "Encripta todas as senhas do banco de dados"
	task migrar_senhas: :environment do
		unless User.attribute_names.include? "password"
			puts "As senhas já foram migradas, terminando"
			return
		end
	
		User.find_each do |user|
			puts "Migrando usuário ##{user.id} #{user.full_name}"
			if !user.valid? || user.attributes["password"].blank?
				puts "Usuário id #{user.id}"
				next
			end
			
			unencripted_password = user.attributes["password"]
		
			user.password = unencripted_password
			user.password_confirmation = unencripted_password
			user.save!
		end
	end
end
