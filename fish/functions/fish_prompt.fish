function fish_prompt
   if not set -q VIRTUAL_ENV_DISABLE_PROMPT
      set -g VIRTUAL_ENV_DISABLE_PROMPT true
   end

   set_color normal
   printf (prompt_pwd)

   if test $VIRTUAL_ENV
       printf "[%s]" (set_color green)(basename $VIRTUAL_ENV)(set_color normal)
   end

   set_color normal
   printf "%s" (__fish_git_prompt)

   set_color cyan
   printf ' » '
   set_color normal
end
