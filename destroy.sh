terraform destroy -var "do_token=${DO_PAT}" -var "pvt_key=${HOME}.ssh/tf_hetzner" -var "pub_key=${HOME}.ssh/tf_hetzner.pub"
