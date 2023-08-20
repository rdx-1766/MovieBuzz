from flask import Flask,render_template,request,session,redirect,url_for
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import ForeignKey,select,delete,update
from flask_login import UserMixin
from flask import flash
from werkzeug.security import generate_password_hash,check_password_hash
from flask_login import login_user,logout_user,login_manager,LoginManager
from flask_login import login_required,current_user
from flask_session import Session
import json,os

#local_server =True
app = Flask(__name__)
app.secret_key='pavankumar'
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

#for login

login_manager = LoginManager(app)
login_manager.login_view='login'

@login_manager.user_loader
def load_user(user_id):
  if session['account_type'] == 'admin':
      return Admin.query.get(int(user_id))
  elif session['account_type'] == 'user':
      return User.query.get(int(user_id))
  else:
      return None

# @login_manager.user_loader
# def load_user(user_id):
#     return User.query.get(int(user_id))

# @login_manager.user_loader
# def load_admin(admin_id):
#     return Admin.query.get(int(admin_id))

app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost:8001/moviebuzz'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Admin(db.Model,UserMixin):
    id = db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String(50))
    email = db.Column(db.String(50))
    mobileno = db.Column(db.BigInteger)
    password = db.Column(db.String(1000))

class User(db.Model, UserMixin):
    id = db.Column(db.Integer,primary_key=True)
    username = db.Column(db.String(50))
    email = db.Column(db.String(50))
    password = db.Column(db.String(1000))

class Movies(db.Model):
    movie_id = db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(50))
    year = db.Column(db.Date)
    director_id = db.Column(db.Integer,db.ForeignKey("director.id", ondelete="CASCADE"))
    genre = db.Column(db.String(50))
    production = db.Column(db.String(50),db.ForeignKey("production.name",ondelete="CASCADE"))
    link = db.Column(db.String(1000))
    poster =db.Column(db.String(100))
    description = db.Column(db.String(1000))

class Director(db.Model):
    id = db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String(50))
    debut_year = db.Column(db.Date)
    image = db.Column(db.String(100))

class Cast(db.Model):
    id = db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String(50))
    age = db.Column(db.Integer)
    awards = db.Column(db.String(50))
    debut_year = db.Column(db.Date)
    image = db.Column(db.String(100))

class Production(db.Model):
    name = db.Column(db.String(50),primary_key=True)
    owner = db.Column(db.String(50))
    image = db.Column(db.String(100))

class Movie_cast(db.Model):
    id = db.Column(db.Integer,primary_key=True)
    act_id = db.Column(db.Integer,db.ForeignKey("cast.id",ondelete="CASCADE"))
    mov_id = db.Column(db.Integer,db.ForeignKey("movies.movie_id",ondelete="CASCADE"))
    role = db.Column(db.String(50))

class Language(db.Model):
    language = db.Column(db.String(50),primary_key=True)
    movieid = db.Column(db.Integer,db.ForeignKey("movies.movie_id",ondelete="CASCADE"),primary_key=True)


class Custcount(db.Model):
    cid = db.Column(db.Integer,db.ForeignKey("user.id",ondelete="CASCADE"),primary_key=True)
    movieid = db.Column(db.Integer,db.ForeignKey("movies.movie_id",ondelete="CASCADE"),primary_key=True)
    rating = db.Column(db.Integer)


class Rating(db.Model):
    rating = db.Column(db.Float,primary_key=True)
    movieid = db.Column(db.Integer,db.ForeignKey("movies.movie_id",ondelete="CASCADE"),primary_key=True)
    count = db.Column(db.Integer)



@app.route('/connnection')

# def database_connection():
#     a=test.query.all()
#     print(a)
#     return render_template('test.html')

@app.route('/test')

def testx():
    return render_template('test.html')

@app.route('/')
def fun():
    query = Movies.query.order_by(Movies.movie_id.desc()).all()
    query1 = db.session.query(Movies,Rating).filter(Movies.movie_id==Rating.movieid).add_columns(Movies.poster,Movies.description,Movies.title,Movies.movie_id).order_by(Rating.rating.desc()).group_by(Rating.rating).all()
    return render_template('index.html',query=query,query1=query1)

@app.route('/home')
def home():
    query = Movies.query.order_by(Movies.movie_id.desc()).all()
    query1 = db.session.query(Movies,Rating).filter(Movies.movie_id==Rating.movieid).add_columns(Movies.poster,Movies.description,Movies.title,Movies.movie_id).order_by(Rating.rating.desc()).group_by(Rating.rating).all()
    return render_template('index.html',query=query,query1=query1)

@app.route('/movies')
def movies():
    if not current_user.is_authenticated:
        flash("Log-In to view the content","primary")
        return render_template('login.html')
    else:
        query = Movies.query.join(Director).add_columns(Movies.movie_id,Movies.title,Movies.year,Movies.director_id,Movies.genre,Movies.production,Movies.link,Movies.poster,Movies.description,Director.name).filter(Director.id==Movies.director_id)
        return render_template('movies.html',username=current_user.username,query=query)
        

@app.route('/movie_db')
def movie_db():
    if not current_user.is_authenticated:
        flash("Log-In to view the content","primary")
        return render_template('admin_login.html')
    else :
        query = Movies.query.join(Director).add_columns(Movies.movie_id,Movies.title,Movies.year,Movies.director_id,Movies.genre,Movies.production,Movies.link,Movies.poster,Movies.description,Director.name).filter(Director.id==Movies.director_id)
        
        # query = db.session.query(Movie_cast,Movies,Cast)\
        #     .add_columns(Cast.name.label("cname"),Movies.movie_id,Movies.title,Movies.year,Movies.director_id,Movies.genre,Movies.production,Movies.link,Movies.poster,Movies.description).filter(
        #     (Movies.movie_id==Movie_cast.mov_id)\
        #     &(Cast.id==Movie_cast.act_id)\
        #     )

        # query = Movies.query.join(Movie_cast,Movie_cast.mov_id==Movies.movie_id).join(Cast,Cast.id==Movie_cast.act_id).add_columns(Cast.name.label("cname"),Movies.movie_id,Movies.title,Movies.year,Movies.director_id,Movies.genre,Movies.production,Movies.link,Movies.poster,Movies.description).filter((Movies.movie_id==Movie_cast.mov_id)&(Movie_cast.act_id==Cast.id))
        
        return render_template('movie_db.html',name= current_user.name,query=query)


@app.route("/language/<string:language>")
def genre(language):
    query = Movies.query.join(Language).add_columns(Movies.movie_id,Movies.title,Movies.year,Movies.director_id,Movies.genre,Movies.production,Movies.link,Movies.poster,Movies.description).filter((Language.language==language) & (Movies.movie_id==Language.movieid))
    print(query)
    return render_template('lg.html',query=query)


@app.route("/genre/<string:genre>")
def lang(genre):
    query = db.session.query(Movies).add_columns(Movies.movie_id,Movies.title,Movies.year,Movies.director_id,Movies.genre,Movies.production,Movies.link,Movies.poster,Movies.description).filter(Movies.genre==genre)
    print(query)
    return render_template('lg.html',query=query)



@app.route("/edit/<string:movie_id>",methods=['POST','GET'])
@login_required
def edit(movie_id):
    posts = Movies.query.join(Director).add_columns(Movies.movie_id,Movies.title,Movies.year,Movies.director_id,Movies.genre,Movies.production,Movies.link,Movies.poster,Movies.description,Director.name).filter(Director.id==Movies.director_id).filter(Movies.movie_id==movie_id).first()
    posts1 = Language.query.join(Movies).filter(Language.movieid==movie_id).all()
    
    if request.method == "POST":
        title1 = request.form.get('title')
        genre1 = request.form.get('radio')
        director1 = request.form.get('director')
        year1 = request.form.get('year')
        link = request.form.get('link')
        language = []
        language = request.form.getlist('language')
        production1 = request.form.get('production')
        description = request.form.get('description')
        poster1 = request.form.get('poster')


        
        director = Director.query.filter_by(name=director1).first()
        production = Production.query.filter_by(name=production1).first()
        
        d_id = None
        p_name=None
        c_id = None
        
                

            
        if director:
            d_id = Director.query.filter(Director.name==director1).first()
        else:
            new_director = db.engine.execute(f"INSERT INTO `director` (`name`) VALUES ('{director1}')")
            d_id = Director.query.filter(Director.name==director1).first()
        if production:
            p_name = Production.query.filter(Production.name==production1).first()
        else:
            new_producer = db.engine.execute(f"INSERT INTO `production` (`name`) VALUES ('{production1}')")
            p_name = Production.query.filter(Production.name==production1).first()

        # movie = Movies.query.filter(Movies.movie_id==movie_id).update(dict(title=title1 ))
    
        # db.session.commit()

        db.engine.execute(f"UPDATE `movies` SET `title`='{title1}' , `genre` = '{genre1}' , `director_id`='{d_id.id}' ,`production`='{p_name.name}', `poster`='{poster1}'  , `description`='{description}' , `year`='{year1}' ,`link` = '{link}'    WHERE `movies`.`movie_id`={movie_id}  ")

        db.engine.execute(f"DELETE FROM `language` WHERE `language`.`movieid`={movie_id}")


        mov_id1 = Movies.query.filter_by(title=title1).with_entities(Movies.movie_id)
        

        for lang in language:
            newlang = Language(language=lang,movieid=mov_id1)
            db.session.add(newlang)
            db.session.commit()

        
        
        flash("Movie Data Updated Successfully ","success")
        return redirect(url_for('movie_db'))

    
    return render_template('edit.html',posts=posts,posts1=posts1)

@app.route("/delete/<string:movie_id>",methods=['POST','GET'])
@login_required
def delete(movie_id):
    
    db.engine.execute(f"DELETE FROM `movies` WHERE `movies`.`movie_id`={movie_id}")
    flash("Movie Deleted Successfully !","success")
        
    return redirect(url_for('movie_db'))

@app.route('/movieSearch',methods = ['POST','GET'])
@login_required
def moviesearch():
    if request.method == "POST":
        if session['account_type']=='user':
            name = request.form.get('name')
            
            id = db.engine.execute(f"CALL search ('{name}')")
            mid = id.fetchall()
            if not  mid:
                flash('No Results found',"warning")
                return redirect('movies')
            movieid = (mid[0])[0]
            count=1
            custcount = db.session.query(Custcount).filter((Custcount.movieid==movieid) & (Custcount.cid==current_user.id)).first()
            if custcount:
                count=0
            query = Movies.query.filter(movieid==Movies.movie_id).first()
            
            query1 = Director.query.join(Movies).filter(Director.id==Movies.director_id).filter(Movies.movie_id==movieid).first()
            query2 = Production.query.join(Movies).filter(Production.name==Movies.production).filter(Movies.movie_id==movieid).first()
            query3 = db.session.query(Movie_cast,Movies,Cast)\
                .add_columns(Cast.name).filter(
                    (Movies.movie_id==movieid)\
                &(Movies.movie_id==Movie_cast.mov_id)\
                &(Cast.id==Movie_cast.act_id)\
                ).all()
            query4 = db.session.query(Movies,Language).add_columns(Language.language).filter((Movies.movie_id==Language.movieid) & (Movies.movie_id==movieid)).all()
            rate = Rating.query.filter(Rating.movieid==movieid).first()
            if rate:
                query5 = rate.rating
            else:
                query5 = '-NA-'
            return render_template('movie_structure.html',count=count,query=query,query1=query1,query2=query2,query3=query3,query4=query4,query5=query5)
        
        if session['account_type']=='admin':
            flash("Only customers can view Movie Page","warning")
            return redirect('movie_db')

    return redirect('movie_structure.html')

@app.route('/signup' , methods = ['POST','GET'])
def signup():
    if request.method == "POST":
        username1 = request.form.get('username')
        email1 = request.form.get('email')
        password = request.form.get('password')
        user = User.query.filter_by(username=username1).first()
        email = User.query.filter_by(email=email1).first()
        if user:
            flash("user already exists","warning")
            return render_template('signup.html')
        
        if email:
            flash("Email already exists","warning")
            return render_template('signup.html')
        encpassword = generate_password_hash(password)

        new_user = db.engine.execute(f"INSERT INTO `user` (`username`,`email`,`password`) VALUES ('{username1}','{email1}','{encpassword}')")

        # newuser = User(username=username1,email=email1,password=encpassword)
        # db.session.add(newuser)
        # db.session.commit()
        flash("Sign-Up Success","success")
        return render_template('login.html')
    return render_template('signup.html')

@app.route('/login', methods = ['POST','GET'])
def login():
    if request.method == "POST":
        #username1 = request.form.get('username')
        email1 = request.form.get('email')
        password1 = request.form.get('password')
        session ["account_type"] = 'user'
        user= User.query.filter_by(email=email1).first()
        #email=User.query.filter_by(email=email1).first()

        if user and check_password_hash(user.password,password1):
            login_user(user)
            flash("Log-In Success","primary")
            return redirect(url_for('movies'))
        else:
            flash("invalid credentials","warning")
            return render_template('login.html')

    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('Log-out Successful','success')
    if session['account_type']=='user':
        return redirect(url_for('login'))
    return redirect(url_for('admin_login'))

@app.route('/admin_signup' , methods = ['POST','GET'])
def admin_signup():
    if request.method == "POST":
        name1 = request.form.get('name')
        email1 = request.form.get('email')
        password1 = request.form.get('password')
        mobileno1 = request.form.get('mobileno')
        mobileno = Admin.query.filter_by(mobileno=mobileno1).first()
        email = Admin.query.filter_by(email=email1).first()
        if mobileno:
            flash("user already exists","warning")
            return render_template('admin_signup.html')
        
        if email:
            flash("Email already exists","warning")
            return render_template('admin_signup.html')
        encpassword = generate_password_hash(password1)

        new_admin = db.engine.execute(f"INSERT INTO `admin` (`name`,`email`,`mobileno`,`password`) VALUES ('{name1}','{email1}','{mobileno1}','{encpassword}')")

        newuser = Admin(name=name1,email=email1,mobileno=mobileno1,password=encpassword)
        db.session.add(newuser)
        db.session.commit()
        flash("Sign-Up Success","success")
        return render_template('admin_login.html')
    return render_template('admin_signup.html')


@app.route('/admin_login', methods = ['POST','GET'])
def admin_login():
    if request.method == "POST":
        #username1 = request.form.get('name')
        email1 = request.form.get('email')
        password1 = request.form.get('password')
        session ["account_type"] = 'admin'
        admin= Admin.query.filter_by(email=email1).first()
        #email=Admin.query.filter_by(email=email1).first()

        if admin and check_password_hash(admin.password,password1):
            login_user(admin)
            flash("Log-In Success","primary")
            return redirect(url_for('movie_db'))
        else:
            flash("invalid credentials","warning")
            return render_template('admin_login.html')

    return render_template('admin_login.html')

@app.route('/addmovie', methods = ['POST','GET'] )
def add_movie(count='0'):
    if request.method == "POST":
        title1 = request.form.get('title')
        genre1 = request.form.get('radio')
        director1 = request.form.get('director')
        year1 = request.form.get('year')
        link = request.form.get('link')
        language = []
        language = request.form.getlist('language')
        cast1 = []
        role1=[]
        cast1.append(request.form.get('cast'))
        role1.append(request.form.get('role'))
        production1 = request.form.get('production')
        description = request.form.get('description')
        poster = request.form.get('poster')
        count = request.form.get('count')
        if(int(count)>=1):
            for i in range(1,int(count)+1):
                cast1.append(request.form.get('cast'+str(i)))
                role1.append(request.form.get('role'+str(i)))
        
         
        title = Movies.query.filter_by(title=title1).first()
        director = Director.query.filter_by(name=director1).first()
        production = Production.query.filter_by(name=production1).first()
        
        d_id = None
        p_name=None
        c_id = None
        if title:
            flash("Movie already exists ","warning")
            return redirect(url_for('add_movie'))
                

            
        if director:
            d_id = Director.query.filter_by(name=director1).with_entities(Director.id)
        else:
            new_director = db.engine.execute(f"INSERT INTO `director` (`name`) VALUES ('{director1}')")
            d_id = Director.query.filter_by(name=director1).with_entities(Director.id)
        if production:
            p_name = Production.query.filter_by(name=production1).with_entities(Production.name)
        else:
            new_producer = db.engine.execute(f"INSERT INTO `production` (`name`) VALUES ('{production1}')")
            p_name = Production.query.filter_by(name=production1).with_entities(Production.name)

        newmovie = Movies(title=title1,year=year1,director_id=d_id,genre=genre1,production=p_name,link=link,poster=poster,description=description)
        db.session.add(newmovie)
        db.session.commit()




        mov_id1 = Movies.query.filter_by(title=title1).with_entities(Movies.movie_id)
        

        for lang in language:
            newlang = Language(language=lang,movieid=mov_id1)
            db.session.add(newlang)
            db.session.commit()

        for i in  range(0,int(count)+1):
                castx = Cast.query.filter_by(name=cast1[i]).first()
                if castx:
                    c_id = Cast.query.filter_by(name=cast1[i]).with_entities(Cast.id)
                else:
                    new_cast = db.engine.execute(f"INSERT INTO `cast`(`name`) VALUES ('{cast1[i]}')")
                    c_id = Cast.query.filter_by(name=cast1[i]).with_entities(Cast.id)
                
                newmoviecast = Movie_cast(act_id=c_id,mov_id=mov_id1,role=role1[i])
                db.session.add(newmoviecast)
                db.session.commit()
        
        flash("Movie Added to DataBase","success")
        return render_template('addmovie.html')

    return render_template('addmovie.html' , methods = ['POST','GET'])

@app.route('/movieStruct/<string:movieid>',methods=['POST','GET'])
def movieStruct(movieid):
    if (not current_user.is_authenticated or not session['account_type']=='user'):
        flash("Log-In to view the content","primary")
        return render_template('login.html')
    else:
        if request.method=="POST":
            star = request.form.get('rate')
            c = Custcount.query.filter((movieid==Rating.movieid) & (Custcount.cid==current_user.id)).first()
            rating = Rating.query.filter((movieid==Rating.movieid)).first()
            query = Movies.query.filter(movieid==Movies.movie_id).first()
            mid = query.movie_id
            count=0
            
            if c:
                count = 0
            if rating:
                new_count = db.engine.execute(f"INSERT INTO `custcount` VALUES ('{current_user.id}','{movieid}','{star}')")
            else: 
                new_rating = db.engine.execute(f"INSERT INTO `rating` (`rating`,`movieid`) VALUES ('{star}','{mid}')")
                new_count = db.engine.execute(f"INSERT INTO `custcount` VALUES ('{current_user.id}','{movieid}','{star}')")
                #new_count = db.engine.execute(f"UPDATE`rating` SET `rating`.`count`= 1 ")
                
            
            
            query1 = Director.query.join(Movies).filter(Director.id==Movies.director_id).filter(Movies.movie_id==movieid).first()
            query2 = Production.query.join(Movies).filter(Production.name==Movies.production).filter(Movies.movie_id==movieid).first()
            query3 = db.session.query(Movie_cast,Movies,Cast)\
                .add_columns(Cast.name,Cast.id).filter(
                    (Movies.movie_id==movieid)\
                &(Movies.movie_id==Movie_cast.mov_id)\
                &(Cast.id==Movie_cast.act_id)\
                ).all()
            query4 = db.session.query(Movies,Language).add_columns(Language.language).filter((Movies.movie_id==Language.movieid) & (Movies.movie_id==movieid)).all()
            rate = Rating.query.filter(Rating.movieid==movieid).first()
            query5 = rate.rating
            return redirect(request.url)
        
        count=1
        custcount = db.session.query(Custcount).filter((Custcount.movieid==movieid) & (Custcount.cid==current_user.id)).first()
        if custcount:
            count=0
        query = Movies.query.filter(movieid==Movies.movie_id).first()
        query1 = Director.query.join(Movies).filter(Director.id==Movies.director_id).filter(Movies.movie_id==movieid).first()
        query2 = Production.query.join(Movies).filter(Production.name==Movies.production).filter(Movies.movie_id==movieid).first()
        query3 = db.session.query(Movie_cast,Movies,Cast)\
            .add_columns(Cast.name,Cast.id).filter(
                (Movies.movie_id==movieid)\
            &(Movies.movie_id==Movie_cast.mov_id)\
            &(Cast.id==Movie_cast.act_id)\
            ).all()
        query4 = db.session.query(Movies,Language).add_columns(Language.language).filter((Movies.movie_id==Language.movieid) & (Movies.movie_id==movieid)).all()
        rate = Rating.query.filter(Rating.movieid==movieid).first()
        if rate:
            query5 = rate.rating
        else:
            query5 = '-NA-'
        session['url']= render_template('movie_structure.html',count=count,query=query,query1=query1,query2=query2,query3=query3,query4=query4,query5=query5)
        return render_template('movie_structure.html',count=count,query=query,query1=query1,query2=query2,query3=query3,query4=query4,query5=query5,methods=['POST','GET'])
            
@app.route('/cast/<string:id>')
def cast(id):
    query = db.session.query(Cast).add_columns(Cast.name,Cast.image,Cast.age,Cast.awards,Cast.debut_year).filter(Cast.id==id).first()
    
    return render_template('cast.html',query=query)

@app.route('/cast_db')
def cast_db():
    if not current_user.is_authenticated:
        flash("Log-In to view the content","primary")
        return render_template('admin_login.html')
    else:
        query = Cast.query.add_columns(Cast.id,Cast.name,Cast.age,Cast.awards,Cast.debut_year,Cast.image)
        return render_template('cast_db.html',query=query)

@app.route('/edit_cast/<string:id>',methods=['POST','GET'])
def edit_cast(id):
    if not current_user.is_authenticated:
        flash("Log-In to view the content","primary")
        return render_template('admin_login.html')
    else:
        if request.method=='POST':
            name = request.form.get('name')
            age = request.form.get('age')
            awards = request.form.get('awards')
            image = request.form.get('link')
            debut_year = request.form.get('debut_year')
            
            db.engine.execute(f"UPDATE `cast` SET `name`='{name}' , `age` = '{age}' , `awards`='{awards}' ,`image`='{image}', `debut_year`='{debut_year}'   WHERE `cast`.`id`={id}  ")
            
            return redirect(url_for('cast_db'))
        query = Cast.query.add_columns(Cast.id,Cast.name,Cast.age,Cast.awards,Cast.debut_year,Cast.image).filter(Cast.id==id).first()
        return render_template('edit_cast.html',query=query)


@app.route('/director_db')
def director_db():
    if not current_user.is_authenticated:
        flash("Log-In to view the content","primary")
        return render_template('admin_login.html')
    else:
        query = Director.query.add_columns(Director.id,Director.name,Director.debut_year,Director.image)
        return render_template('director_db.html',query=query)


@app.route('/edit_director/<string:id>',methods=['POST','GET'])
def edit_director(id):
    if not current_user.is_authenticated:
        flash("Log-In to view the content","primary")
        return render_template('admin_login.html')
    else:
        if request.method=='POST':
            name = request.form.get('name')
            image = request.form.get('link')
            debut_year = request.form.get('debut_year')
            
            db.engine.execute(f"UPDATE `director` SET `name`='{name}' ,`image`='{image}', `debut_year`='{debut_year}'   WHERE `director`.`id`={id}  ")
            
            return redirect(url_for('director_db'))
        query = Director.query.add_columns(Director.id,Director.name,Director.debut_year,Director.image).filter(Director.id==id).first()
        return render_template('edit_director.html',query=query)

@app.route('/production_db')
def production_db():
    if not current_user.is_authenticated:
        flash("Log-In to view the content","primary")
        return render_template('admin_login.html')
    else:
        query = Production.query.add_columns(Production.name,Production.owner,Production.image)
        return render_template('production_db.html',query=query)


@app.route('/edit_production/<string:name>',methods=['POST','GET'])
def edit_production(name):
    if not current_user.is_authenticated:
        flash("Log-In to view the content","primary")
        return render_template('admin_login.html')
    else:
        if request.method=='POST':
            name1 = request.form.get('name')
            image = request.form.get('link')
            owner = request.form.get('owner')
            
            db.engine.execute(f"UPDATE `production` SET `image`='{image}', `owner`='{owner}'   WHERE `production`.`name`={name}  ")
            
            return redirect(url_for('production_db'))
        query = Production.query.add_columns(Production.name,Production.owner,Production.image).filter(Production.name==name).first()
        return render_template('edit_production.html',query=query)

if __name__ == "__main__":
    app.run(debug=True)