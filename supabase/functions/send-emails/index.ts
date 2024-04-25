// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
/// <reference types="https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts" />

/*console.log("Hello from Functions!")*/

Deno.serve(async (req) => {
  /*const { name } = await req.json()
  const data = {
    message: `Hello ${name}!`,
  }

  return new Response(
    JSON.stringify(data),
    { headers: { "Content-Type": "application/json" } },
  )*/

  const { createClient } = require('@supabase/supabase-js');
  const nodemailer = require('nodemailer');

  const SUPABASE_URL = 'https://vprhyrbflnzfwxhpfwrd.supabase.co';
  const SUPABASE_KEY = 'YOUR_SUPABASE_KEY';

  const transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
      user: 'your_email@gmail.com', // Your Gmail address
      pass: 'your_password', // Your Gmail password
    },
  });

  exports.handler = async (event, context) => {
    const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

    const { data: emails, error } = await supabase
      .from('emails')
      .select('email')
      .order('inserted_at', { ascending: false })
      .limit(1)
      .execute();

    if (error) {
      console.error('Error fetching emails:', error.message);
      return;
    }

    const latestEmail = emails[0];
    if (!latestEmail) {
      console.error('No emails found');
      return;
    }

    const mailOptions = {
      from: 'your_email@gmail.com',
      to: latestEmail.email,
      subject: 'New blog published on marketika',
      text: 'Check out our latest blog on Marketika!',
    };

    try {
      await transporter.sendMail(mailOptions);
      console.log('Email sent successfully');
    } catch (error) {
      console.error('Error sending email:', error);
    }
  };
})

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/send-emails' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
