# Welcome to Le Lobby
<p>The Lobby platform is developed as part of The Hacking Project session 11 (winter 2020) Final Project.</p>
<p>The team consists of Agathe Plunian, Amine Amarouche, Axel Aidan, Daniel Venera, Mathieu Lasserre and Nicolas Chattour.</p>
<p>The project is developed under rails Rails 5.2.4.1.</p>

<h3>Cloning</h3>
<h5>Configuration</h5>
<p>Run the following command lines to set up your local clone :</p>
<pre><code>git clone https://github.com/axaidan/lobby</code></pre>
<pre><code>cd lobby</code></pre>
<pre><code>bundle install</code></pre>
<h5>Database creation</h5>
<pre><code>rails db:create</code></pre>
<pre><code>rails db:migrate</code></pre>
<h5>Database initialization</h5>
<pre><code>rails db:seed</code></pre>
<h5>Run the local server</h5>
<pre><code>rails server</code></pre>
<p>Open your web browser and go to http://localhost:3000/</p>
<h5>Using local server</h5>
<p>All seeded users have the same password which is "nonono"</p>
<p>An admin account is seeded in db/seeds.rb</p>
<p>A donation feature is implemented using Stripe. The feature is in testing process, so you won't be charged. To test this feature you need Stripe API keys and to set them in environment variables. Once it's done, you can use the Stipe's test credit card number which '4242 4242 4242 4242', a future expiration date and any three digits for CVC.</p>
<p>A mailing feature is implemented using Sendgrid. To test this feature you need Sendgrid API keys and to set them in environment variables</p>
<h3>Models</h3>
<p>The Project is based on four essential models :</p>
<ul>
<li>User : it uses Devise gem to sign up with e-mail and password. You are then invited to complete your user profile. </li>
<li>Commitment : it represents a daily habit to be changed in order to be part of the ecological transition. To be created it needs a Theme and a Source</li>
<li>Theme : themes are commitment's categories, it also needs a Source to be created. A user can follow a Theme, but no feature has been implemented in this purpose. It only works as a category feature for Commitments for the moment.</li>
<li>Source : a source is a piece of information that ecologically justifies the presence of a Commitment or a Theme in the website. It can come from the press, NGOs, or from scientifical studies. It is a polymorphic model as :sourceable.</li>
</ul>
<br/>
<p>A Forum feature is implemented that comes with three essential models :</p>
<ul>
<li>Forum : it optionnally belongs_to a Commitment, which makes it the Forum for this Commitment, if it doesn't belong_to a Commitment, it is part of the General Forums. A forum has_many Posts</li>
<li>Post : they are created by users, if the forum it is being created in is a Commitment's Forum, the user needs to take the Commitment in order to use its Forum.</li>
<li>Reply : they are replies to the post, if the post's forum it is being created in is a Commitment's Forum, it goes the same, the User must have taken the Commitment.
</ul>
<p>General Forums can be used by any logged in user.</p>
<br/>
<p>Many database tables are N-N linked between each other, it implies the presence many join tables which are :</p>
<ul>
<li>UserCommitment</li>
<li>UserTheme</li>
<li>CommitmentTheme</li>
</ul>
<h3>The Project</h3>
<p>Website => https://le-lobby.herokuapp.com/</p>
<p>WThis is the first version of the site. It is set to be improved in the coming weeks.</p>
<h5>WWhat we are:</h5>
<ul>
<li>a platform bringing together environmental commitments, currently confined to the little gestures of daily life</li>
a platform allowing you as a visitor or as a user to send us your suggestions</li>
a non-profit association law project of 1901 under development</li>
a student project in the field of web development</li>
</ul>
<h5>What we want to be in the future:</h5>
<ul>
<li>a non-profit 1901 french law association</li>
<li>an ecology-oriented platform fully open to consultation without advertising</li>
<li>a platform centralizing the information provided by the media we choose</li>
<li>an exchange and proposal platform via a system of Forums and Events</li>
<li>a platform offering lobbying actions to the legislator, proposals submitted to the vote of users and members</li>
</ul>
<h5>What we are not:</h5>
<ul>
<li>a company</li>
<li>a lobby defending private or commercial interests</li>
<li>a social network reselling the information of its user</li>s
<li>a simple student project: we want to develop and support this network beyond our training</li>
</ul>
