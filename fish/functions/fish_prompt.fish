function fish_prompt
	if not set -q VIRTUAL_ENV_DISABLE_PROMPT
      set -g VIRTUAL_ENV_DISABLE_PROMPT true
   end
   set_color cyan
   printf '%s' (whoami)
   set_color normal
   printf '::'

   set_color blue
   printf '%s' (hostname|cut -d . -f 1)
   set_color normal
   printf '['

   set_color normal
   printf '%s]' (prompt_pwd)
   set_color normal

   if test $VIRTUAL_ENV
       printf "(%s)" (set_color green)(basename $VIRTUAL_ENV)(set_color normal)
   end
   set_color purple
   printf ' » '
   set_color normal
end
